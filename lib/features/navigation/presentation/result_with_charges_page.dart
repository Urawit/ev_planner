import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/theme/ev_design_system.dart';
import '../../../shared/widgets/widgets.dart';
import '../domain/entities/station_entity.dart';
import 'logic/logic.dart';

class ResultWithChargesPageDataModel {
  const ResultWithChargesPageDataModel(
      {required this.startLatLong,
      required this.destLatLong,
      required this.polylinePoints,
      required this.stationIdList,
      required this.travelDurationInHours,
      required this.remainingBatteryAtDestination,
      required this.totalDistance});

  final LatLng startLatLong;
  final LatLng destLatLong;
  final List<LatLng> polylinePoints;
  final List<String> stationIdList;
  final double travelDurationInHours;
  final int remainingBatteryAtDestination;
  final double totalDistance;
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

  Future<BitmapDescriptor> _getCustomIcon(bool isStationInRoute) async {
    final ByteData data = await rootBundle.load(
      isStationInRoute
          ? 'assets/images/default_evolt_node_icon.png'
          : 'assets/images/out_of_bound_node_icon.png',
    );
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
      final BitmapDescriptor customIcon =
          await _getCustomIcon(isStationInRoute);

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
            BitmapDescriptor.hueGreen), // Correct usage
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

  void openGoogleMaps() async {
    final double startLat = widget.data.startLatLong.latitude;
    final double startLng = widget.data.startLatLong.longitude;
    final double destLat = widget.data.destLatLong.latitude;
    final double destLng = widget.data.destLatLong.longitude;

    final Uri googleMapsUrl = Uri.parse(
        "https://www.google.com/maps/dir/?api=1&origin=$startLat,$startLng&destination=$destLat,$destLng&travelmode=driving");

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not open Google Maps.';
    }
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

  void _drawRoutePolyline() {
    final Polyline routePolyline = Polyline(
      polylineId: const PolylineId("route"),
      color: Colors.blue,
      width: 5,
      points: widget.data.polylinePoints,
    );

    setState(() {
      _polylines.clear();
      _polylines.add(routePolyline);
    });
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
            padding: const EdgeInsets.only(
                top: 55, left: 10, right: 10, bottom: 568),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
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
                      )
                    ],
                  ),
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
                              '0',
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
                          width: 270,
                          child: Text(
                            _startAddress,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ))
                    ],
                  ),
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
                          width: 270,
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
                            Image.asset("assets/images/time.png", scale: 6.0),
                            const SizedBox(width: 10),
                            Text(
                                formatDuration(
                                    widget.data.travelDurationInHours),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ],
                        ),
                        GestureDetector(
                          onTap: openGoogleMaps,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/google_map_icon.png",
                                scale: 4.8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Google Map',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
