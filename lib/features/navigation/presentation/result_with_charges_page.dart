import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/theme/ev_design_system.dart';
import '../../../shared/widgets/widgets.dart';
import '../data/models/charging_info_model.dart';
import '../domain/entities/entities.dart';
import 'logic/logic.dart';

class ResultWithChargesPageDataModel {
  const ResultWithChargesPageDataModel(
      {required this.startLatLong,
      required this.destLatLong,
      required this.stationIdList,
      required this.travelDurationInHours,
      required this.remainingBatteryAtDestination,
      required this.totalDistance,
      required this.result,
      required this.specificSelectedRoute});

  final LatLng startLatLong;
  final LatLng destLatLong;
  final List<String> stationIdList;
  final double travelDurationInHours;
  final double remainingBatteryAtDestination;
  final double totalDistance;
  final GetResultEntity result;
  final RouteEntity specificSelectedRoute;
}

class ResultWithChargePage extends ConsumerStatefulWidget {
  const ResultWithChargePage({
    required this.data,
    super.key,
  });

  final ResultWithChargesPageDataModel data;

  @override
  ResultWithChargePageState createState() => ResultWithChargePageState();
}

class ResultWithChargePageState extends ConsumerState<ResultWithChargePage> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  String _startAddress = "Loading...";
  String _destinationAddress = "Loading...";

  bool _isMinimized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getStationList();
      _drawRoutePolyline();
      _getAddresses();
    });
  }

  void _getStationList() {
    ref.read(stationProvider.notifier).getStationList();
  }

  Future<BitmapDescriptor> _getCustomIcon(
      bool isStationInRoute, bool isChargingStop) async {
    final String iconPath = isChargingStop
        ? 'assets/images/charged_evolt_node_icon.png'
        : (isStationInRoute
            ? 'assets/images/default_evolt_node_icon.png'
            : 'assets/images/out_of_bound_node_icon.png');

    final ByteData data = await rootBundle.load(iconPath);
    final Uint8List originalBytes = data.buffer.asUint8List();

    final ui.Codec codec =
        await ui.instantiateImageCodec(originalBytes, targetWidth: 35);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? resizedData =
        await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.bytes(resizedData!.buffer.asUint8List());
  }

  void _addStationMarkers(List<StationEntity> stations) async {
    _markers.clear();
    for (var station in stations) {
      bool isStationInRoute =
          widget.data.stationIdList.contains(station.stationId);
      bool isChargingStop = widget.data.result.chargingInfoList.any(
          (chargingInfo) =>
              chargingInfo.stationId.toString() == station.stationId);

      final BitmapDescriptor customIcon =
          await _getCustomIcon(isStationInRoute, isChargingStop);

      _markers.add(
        Marker(
          markerId: MarkerId(station.stationId),
          position: LatLng(station.lat ?? 0, station.long ?? 0),
          infoWindow: InfoWindow(title: station.stationName),
          icon: customIcon,
          onTap: () {
            if (isStationInRoute) {
              context.push('/station-detail/${station.stationId}');
            }
          },
        ),
      );
    }

    _markers.add(
      Marker(
        markerId: const MarkerId("start"),
        position: widget.data.startLatLong,
        infoWindow: const InfoWindow(title: "Starting point"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueBlue), // Correct usage
      ),
    );

    _markers.add(
      Marker(
        markerId: const MarkerId("dest"),
        position: widget.data.destLatLong,
        infoWindow: const InfoWindow(title: "Destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed), // Correct usage
      ),
    );

    // ! for marker to be updated
    setState(() {});
  }

  Future<void> _getAddresses() async {
    try {
      List<Placemark> startPlacemarks = await placemarkFromCoordinates(
        widget.data.startLatLong.latitude,
        widget.data.startLatLong.longitude,
      );

      List<Placemark> destPlacemarks = await placemarkFromCoordinates(
        widget.data.destLatLong.latitude,
        widget.data.destLatLong.longitude,
      );

      if (startPlacemarks.isNotEmpty) {
        _startAddress =
            "${startPlacemarks.first.street}, ${startPlacemarks.first.locality}";
      }

      if (destPlacemarks.isNotEmpty) {
        _destinationAddress =
            "${destPlacemarks.first.street}, ${destPlacemarks.first.locality}";
      }

      setState(() {}); // Update UI
    } catch (e) {
      print("Error fetching addresses: $e");
    }
  }

  void openGoogleMapsNavigation() {
    final start =
        "${widget.data.startLatLong.latitude},${widget.data.startLatLong.longitude}";
    final destination =
        "${widget.data.destLatLong.latitude},${widget.data.destLatLong.longitude}";

    List<String> waypoints = widget.data.result.chargingInfoList.map((station) {
      return "${station.lat},${station.long}";
    }).toList();

    // Construct Google Maps URL
    String googleMapsUrl = "https://www.google.com/maps/dir/?api=1"
        "&origin=$start"
        "&destination=$destination";

    if (waypoints.isNotEmpty) {
      googleMapsUrl += "&waypoints=${waypoints.join('|')}";
    }

    // Open the URL
    launchUrl(Uri.parse(googleMapsUrl));
  }

  void listener() {
    ref.listen<StationState>(stationProvider, (previous, next) {
      next.whenOrNull(data: (stations) {
        _addStationMarkers(stations);
      }, error: (_) {
        errorPopupWidget(
          context: context,
          errorMessage:
              'The Server have failed to get stations data. Please refresh the page',
          buttonLabel: 'Refresh',
          onRetry: () {
            _getStationList();
          },
        );
      });
    });
  }

  Future<List<LatLng>> _fetchRoutePolyline(
      LatLng origin, LatLng destination) async {
    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=AIzaSyBQ3FCQRjQbRTulu_9fir3d1NI-iOi15_g&mode=driving';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final points = data['routes'][0]['overview_polyline']['points'];
          return _decodePolyline(points);
        } else {
          throw Exception('Failed to load directions');
        }
      } else {
        throw Exception('Failed to load directions');
      }
    } catch (e) {
      throw Exception('Error fetching directions: $e');
    }
  }

// Decode the polyline from Google Directions API
  List<LatLng> _decodePolyline(String polyline) {
    List<LatLng> polylineList = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int shift = 0;
      int result = 0;
      int byte;
      do {
        byte = polyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);
      int dLat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dLat;

      shift = 0;
      result = 0;
      do {
        byte = polyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);
      int dLng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dLng;

      polylineList.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return polylineList;
  }

  void _drawRoutePolyline() async {
    try {
      List<LatLng> routePoints = [];

      // Get charging stations in order
      List<LatLng> stationPoints = widget.data.result.chargingInfoList
          .where((chargingInfo) =>
              chargingInfo.lat != null && chargingInfo.long != null)
          .map((chargingInfo) => LatLng(chargingInfo.lat!, chargingInfo.long!))
          .toList();

      LatLng previousPoint = widget.data.startLatLong;

      for (LatLng station in stationPoints) {
        List<LatLng> segment =
            await _fetchRoutePolyline(previousPoint, station);
        routePoints.addAll(segment);
        previousPoint = station;
      }

      List<LatLng> lastSegment =
          await _fetchRoutePolyline(previousPoint, widget.data.destLatLong);
      routePoints.addAll(lastSegment);

      final Polyline routePolyline = Polyline(
        polylineId: const PolylineId("route"),
        color: Colors.blue,
        width: 5,
        points: routePoints,
      );

      setState(() {
        _polylines.clear();
        _polylines.add(routePolyline);
      });
    } catch (e) {
      print("Error drawing route polyline: $e");
    }
  }

  String formatDuration(double hours) {
    if (hours < 1) {
      int minutes = (hours * 60).round();
      return "$minutes min";
    } else if (hours >= 24) {
      int days = (hours / 24).floor();
      double remainingHours = hours % 24;
      if (remainingHours == 0) {
        return "$days day${days > 1 ? 's' : ''}";
      } else {
        return "$days day${days > 1 ? 's' : ''} ${remainingHours.toStringAsFixed(1)} hr";
      }
    } else {
      return "${hours.toStringAsFixed(1)} hr";
    }
  }

  @override
  Widget build(BuildContext context) {
    listener();
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.data.startLatLong,
              zoom: 14.0,
            ),
            polylines: _polylines,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 55, left: 10, right: 10, bottom: 0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _isMinimized
                  ? 55
                  : MediaQuery.of(context).size.height * 0.425,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => context.pop(),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Result',
                          style: EVDesignSystem.textStyles.headline3,
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(_isMinimized
                              ? Icons.expand_more
                              : Icons.expand_less),
                          onPressed: () {
                            setState(() {
                              _isMinimized = !_isMinimized;
                            });
                          },
                        ),
                      ],
                    ),
                    if (!_isMinimized) ...[
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  widget.data.stationIdList.length.toString(),
                                  style: EVDesignSystem.textStyles.description4,
                                ),
                                Text(
                                  'Station',
                                  style: EVDesignSystem.textStyles.description3,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.data.totalDistance.toStringAsFixed(1),
                                  style: EVDesignSystem.textStyles.description4,
                                ),
                                Text(
                                  'Distance (km)',
                                  style: EVDesignSystem.textStyles.description3,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '${widget.data.remainingBatteryAtDestination.toString()} %',
                                  style: EVDesignSystem.textStyles.description4,
                                ),
                                Text(
                                  'Remaining Battery',
                                  style: EVDesignSystem.textStyles.description3,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.data.result.chargingInfoList.length
                                      .toString(),
                                  style: EVDesignSystem.textStyles.description4,
                                ),
                                Text(
                                  'Charge',
                                  style: EVDesignSystem.textStyles.description3,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text('From',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: EVDesignSystem.colors.orange)),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                              width: 260,
                              child: Text(
                                _startAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ))
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 0.35,
                        ),
                      ),
                      _buildChargeAtSection(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 0.35,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text('To',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: EVDesignSystem.colors.orange)),
                          const SizedBox(
                            width: 33,
                          ),
                          SizedBox(
                              width: 260,
                              child: Text(
                                _destinationAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/time.png",
                                    scale: 6.0),
                                const SizedBox(width: 10),
                                Text(
                                    formatDuration(widget
                                            .data.travelDurationInHours +
                                        widget.data.result.totalChargingTime),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ],
                            ),
                            GestureDetector(
                              onTap: openGoogleMapsNavigation,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/google_map_icon.png",
                                    scale: 4.8,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text('Google Map\'s',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ]
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChargeAtSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 18),
              Text(
                "Charging Stops",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: EVDesignSystem.colors.orange),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ...widget.data.result.chargingInfoList.map((chargingInfo) {
            final routeSegment =
                widget.data.specificSelectedRoute.chargingInfoList.firstWhere(
              (segment) => segment.stationId == chargingInfo.stationId,
              orElse: () => const ChargingInfoModel(
                  stationName: '', energyUsedWhenCharge: 0, stationId: 0),
            );

            return Row(
              children: [
                const SizedBox(width: 71),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Charge at: ${chargingInfo.stationName}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "From: ${routeSegment.batteryAtStation?.toInt()}% to  ${routeSegment.chargeTo?.toInt()}%"),
                    Text(
                        "Charging Time: ${formatDuration(chargingInfo.chargingTime ?? 0)}"),
                  ],
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
