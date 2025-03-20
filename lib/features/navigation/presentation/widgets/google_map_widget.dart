import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import '../../../../shared/widgets/error_popup_widget.dart';

import '../../../sign_in/data/data.dart';
import '../../../sign_in/presentation/logic/logic.dart';

import '../../data/data.dart';
import '../../domain/entities/entities.dart';
import '../logic/calculate_route/calculate_route_provider.dart';
import '../logic/logic.dart';
import '../logic/result_planner_provider.dart';
import 'widgets.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends ConsumerState<GoogleMapWidget>
    with SingleTickerProviderStateMixin {
  GoogleMapController? _mapController;
  LatLng? _startingLocation;
  LatLng? _destinationLocation;
  String _lastTappedField = "destination";
  final Set<Marker> _markers = {};

  //TODO might be used

  // Set<Polyline> _polylines = {};
  List<LatLng> _routePolylineCoordinates = [];

  final TextEditingController _locationDescriptionController =
      TextEditingController();
  final TextEditingController _destinationDescriptionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkAndRequestPermission();
    _getCurrentLocation();
    _getStationList();
  }

  void _getStationList() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(stationProvider.notifier).getStationList();

      ref.read(signInProvider.notifier).signIn(
            signInInput: const SignInInputModel(
                email: 'admin@gmail.com', password: 'Chocolol1*'),
          );
    });
  }

  Future<BitmapDescriptor> _getCustomIcon({int width = 10}) async {
    final ByteData data =
        await rootBundle.load('assets/images/default_evolt_node_icon.png');
    final Uint8List originalBytes = data.buffer.asUint8List();

    final ui.Codec codec =
        await ui.instantiateImageCodec(originalBytes, targetWidth: width);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? resizedData =
        await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.bytes(resizedData!.buffer.asUint8List());
  }

  void _addStationMarkers(List<StationEntity> stations) async {
    final BitmapDescriptor customIcon = await _getCustomIcon(width: 35);

    for (var station in stations) {
      _markers.add(
        Marker(
          markerId: MarkerId(station.stationId),
          position: LatLng(station.lat ?? 0, station.long ?? 0),
          infoWindow: InfoWindow(title: station.stationName),
          onTap: () {
            context.push('/station-detail/${station.stationId}');
          },
          icon: customIcon,
        ),
      );
    }
  }

  Future<bool> _checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission != LocationPermission.deniedForever;
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    bool hasPermission = await _checkAndRequestPermission();
    if (!hasPermission) {
      if (mounted) {
        errorPopupWidget(
          context: context,
          errorMessage: 'Location access is required to use this feature.',
          additionalErrorMessage:
              'Please enable location permissions in your device settings to proceed.',
          buttonLabel: 'Acknowledge',
          onRetry: () {
            Navigator.of(context).pop();
            context.go('/error');
          },
        );
      }
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _startingLocation = LatLng(position.latitude, position.longitude);
          _getAddressFromLatLng(
              _startingLocation!, _locationDescriptionController);
          _updateMarker("startingLocation", _startingLocation!,
              BitmapDescriptor.hueGreen, "Starting Location");
          _moveCameraToLocation(_startingLocation!);
        });
      }
    });
  }

  Future<void> _getAddressFromLatLng(
      LatLng latLng, TextEditingController controller) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      Placemark place = placemarks[0];

      setState(() {
        controller.text =
            "${place.name ?? ""}, ${place.street ?? ""}, ${place.locality ?? ""}, ${place.administrativeArea ?? ""}, ${place.country ?? ""}";
      });
    } catch (e) {
      setState(() {
        controller.text = "Address not found.";
      });
    }
  }

  void _moveCameraToLocation(LatLng latLng) {
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void _updateMarker(
      String markerId, LatLng position, double hue, String title) {
    _markers.removeWhere((marker) => marker.markerId.value == markerId);
    _markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: position,
        infoWindow: InfoWindow(title: title),
        icon: BitmapDescriptor.defaultMarkerWithHue(hue),
      ),
    );
  }

  void _onMapTapped(LatLng latLng) {
    if (_lastTappedField.isEmpty) {
      return; // Prevent setting a marker if no field is selected
    }
    if (mounted) {
      setState(() {
        if (_lastTappedField == "starting") {
          _startingLocation = latLng;
          _getAddressFromLatLng(latLng, _locationDescriptionController);
          _updateMarker("startingLocation", latLng, BitmapDescriptor.hueGreen,
              "Starting Location");
        } else if (_lastTappedField == "destination") {
          _destinationLocation = latLng;
          _getAddressFromLatLng(latLng, _destinationDescriptionController);
          _updateMarker(
              "destination", latLng, BitmapDescriptor.hueRed, "Destination");
        }

        // Reset selection after setting a marker
        _lastTappedField = "";
      });
    }
  }

  void _onStartingLocationTap() {
    setState(() {
      _lastTappedField = "starting";
    });
  }

  void _onDestinationLocationTap() {
    setState(() {
      _lastTappedField = "destination";
    });
  }

  void _onPressedPlanTrip() {
    _getRoutePolylineData();
  }

  Future<void> _getRoutePolylineData() async {
    if (_startingLocation == null ||
        _destinationDescriptionController.text.isEmpty) {
      return;
    }

    String origin =
        "${_startingLocation?.latitude},${_startingLocation?.longitude}";
    String destination =
        "${_destinationLocation?.latitude},${_destinationLocation?.longitude}";

    //TODO DELETE

    // ref.read(startLatLongProvider.notifier).state = LatLng(
    //   _startingLocation?.latitude ?? 0.0,
    //   _startingLocation?.longitude ?? 0.0,
    // );

    // ref.read(destinationLatLongProvider.notifier).state = LatLng(
    //   _destinationLocation?.latitude ?? 0.0,
    //   _destinationLocation?.longitude ?? 0.0,
    // );

    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=AIzaSyBQ3FCQRjQbRTulu_9fir3d1NI-iOi15_g&mode=driving";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      if (decodedResponse['routes'].isNotEmpty) {
        final points =
            decodedResponse['routes'][0]['overview_polyline']['points'];

        // Decode and store the route polyline for later use
        _routePolylineCoordinates = _decodePolyline(points);
        _findStationsOnRoute(_routePolylineCoordinates);
        //TODO might be used

        // _drawStoredPolyline();
      }
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polylineCoordinates = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int shift = 0, result = 0;
      int b;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dLat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dLat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dLng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dLng;

      polylineCoordinates.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return polylineCoordinates;
  }

  void _findStationsOnRoute(List<LatLng> polylinePoints) {
    const double thresholdDistance = 0.5; // 0.5 km (500 meters)

    List<StationDistanceEntity> stationDistances = [];

    for (var station in ref.read(stationProvider).maybeWhen(
          data: (stations) => stations,
          orElse: () => [],
        )) {
      LatLng stationLatLng = LatLng(station.lat ?? 0, station.long ?? 0);

      // !calculate how far the station is from the starting point
      double distanceFromStartToStation = _calculateDistance(
          _startingLocation?.latitude ?? 0,
          _startingLocation?.longitude ?? 0,
          stationLatLng.latitude,
          stationLatLng.longitude);

      for (var point in polylinePoints) {
        double distance = _calculateDistance(stationLatLng.latitude,
            stationLatLng.longitude, point.latitude, point.longitude);

        if (distance <= thresholdDistance) {
          stationDistances.add(
            StationDistanceModel(
              stationId: station.stationId.toString(),
              distanceFromStartToStation: distanceFromStartToStation,
            ),
          );
          break;
        }
      }
    }

    double totalDistance = _calculateDistance(
      _startingLocation?.latitude ?? 0,
      _startingLocation?.longitude ?? 0,
      _destinationLocation?.latitude ?? 0,
      _destinationLocation?.longitude ?? 0,
    );

    // Sort by distance from start
    stationDistances.sort((a, b) =>
        (a.distanceFromStartToStation).compareTo(b.distanceFromStartToStation));

    // Update provider state
    ref.read(stationDistanceProvider.notifier).state = stationDistances;

    final userContext = ref.read(userContextProvider);
    final batteryPercentage = ref.read(currentBatteryProvider);

    ref.read(calculateRouteProvider.notifier).getCalculateRouteList(
        calculateRouteInput: CalculateRouteInputModel(
            modelId: userContext?.carModelId ?? '',
            totalDistance: totalDistance,
            currentBattery: batteryPercentage?.toInt() ?? 0,
            distanceList: stationDistances));
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371; // Radius of Earth in km
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c; // Distance in km
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  //TODO might be used

  // void _drawStoredPolyline() {
  //   if (_routePolylineCoordinates.isEmpty) {
  //     return;
  //   }

  //   setState(() {
  //     _polylines.add(Polyline(
  //       polylineId: const PolylineId("route"),
  //       color: Colors.blue,
  //       width: 5,
  //       points: _routePolylineCoordinates,
  //     ));
  //   });
  // }
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
            Navigator.of(context).pop();
            _getStationList();
          },
        );
      });
    });

    ref.listen(calculateRouteProvider, (previous, next) {
      next.whenOrNull(
        success: (tripId) {
          // TODO work
          // ref.read()
          //   Todo delete

          // showFlushbar(
          //   context: context,
          //   title: 'Edit Review Successful',
          //   message: 'Your review has been successfully updated.',
          //   backgroundColor: Colors.green,
          // );
        },
        error: (_) {
          errorPopupWidget(
            context: context,
            errorMessage: 'Planning feature have failed, Please retry again',
            buttonLabel: 'retry',
            onRetry: _onPressedPlanTrip,
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    listener();

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _startingLocation ?? const LatLng(0, 0),
              zoom: 12.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            markers: _markers,
            onTap: _onMapTapped,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          NavigationInputWidget(
            onStartingLocationTap: _onStartingLocationTap,
            onDestinationLocationTap: _onDestinationLocationTap,
            onPressedPlanTrip: _onPressedPlanTrip,
            locationDescriptionController: _locationDescriptionController,
            destinationDescriptionController: _destinationDescriptionController,
            lastTappedField: _lastTappedField,
          ),
        ],
      ),
    );
  }
}
