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
import '../logic/get_route_list/get_route_list_provider.dart';
import '../logic/logic.dart';
import '../logic/result_planner_provider.dart';
import '../result_without_charges_page.dart';
import '../route_selection_page.dart';
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

  List<String> stationIdsOnRoute = [];
  double? travelDurationInHours;
  double? totalDistance;

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
                email: 'admin@gmail.com', password: 'Abcdef1*'),
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
          ref.read(startLatLongProvider.notifier).state = _startingLocation;
          _getAddressFromLatLng(
              _startingLocation!, _locationDescriptionController);
          _updateMarker("startingLocation", _startingLocation!,
              BitmapDescriptor.hueBlue, "Starting Location");
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
          _updateMarker("startingLocation", latLng, BitmapDescriptor.hueBlue,
              "Starting Location");
          ref.read(startLatLongProvider.notifier).state = latLng;
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

    stationIdsOnRoute.clear();

    String origin =
        "${_startingLocation?.latitude},${_startingLocation?.longitude}";
    String destination =
        "${_destinationLocation?.latitude},${_destinationLocation?.longitude}";

    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=AIzaSyBQ3FCQRjQbRTulu_9fir3d1NI-iOi15_g&mode=driving";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      if (decodedResponse['routes'].isNotEmpty) {
        final points =
            decodedResponse['routes'][0]['overview_polyline']['points'];

        // Extract the distance (in meters) from the API response
        int distanceInMeters =
            decodedResponse['routes'][0]['legs'][0]['distance']['value'];

        // Convert the distance to kilometers
        totalDistance = distanceInMeters / 1000.0;

        // Decode and store the route polyline for later use
        _routePolylineCoordinates = _decodePolyline(points);

        // calculate time it's take from direction api
        int durationInSeconds =
            decodedResponse['routes'][0]['legs'][0]['duration']['value'];
        // Convert seconds to hours (fractional hours)
        travelDurationInHours = durationInSeconds / 3600.0;

        _findStationsOnRoute(_routePolylineCoordinates);
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

  Future<double> _getDrivingDistance(
      double startLat, double startLon, double endLat, double endLon) async {
    String origin = "$startLat,$startLon";
    String destination = "$endLat,$endLon";

    // URL for Google Directions API
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=AIzaSyBQ3FCQRjQbRTulu_9fir3d1NI-iOi15_g&mode=driving";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      if (decodedResponse['routes'].isNotEmpty) {
        // Get the distance from the response
        int distanceInMeters =
            decodedResponse['routes'][0]['legs'][0]['distance']['value'];
        // Return distance in kilometers
        return distanceInMeters / 1000.0;
      }
    }

    return 0.0;
  }

  Future<void> _findStationsOnRoute(List<LatLng> polylinePoints) async {
    const double thresholdDistance = 10;
    List<StationDistanceEntity> stationDistances = [];

    for (var station in ref.read(stationProvider).maybeWhen(
          data: (stations) => stations,
          orElse: () => [],
        )) {
      LatLng stationLatLng = LatLng(station.lat ?? 0, station.long ?? 0);

      // ! Now use the Google Directions API to calculate distance from start to station
      double distanceFromStartToStation = await _getDrivingDistance(
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

    // Sort by distance from start
    stationDistances.sort((a, b) =>
        (a.distanceFromStartToStation).compareTo(b.distanceFromStartToStation));

    for (var stationDistance in stationDistances) {
      stationIdsOnRoute.add(stationDistance.stationId);
    }

    // Update provider state
    ref.read(stationDistanceProvider.notifier).state = stationDistances;

    final userContext = ref.read(userContextProvider);
    final batteryPercentage = ref.read(currentBatteryProvider);

    ref.read(calculateRouteProvider.notifier).getCalculateRouteList(
          calculateRouteInput: CalculateRouteInputModel(
            modelId: userContext?.carModelId ?? '',
            totalDistance: totalDistance ?? 0,
            currentBattery: batteryPercentage?.toInt() ?? 0,
            distanceList: stationDistances,
          ),
        );
  }

  double _calculateDistance(
      double startLat, double startLon, double endLat, double endLon) {
    const double R = 6371; // Radius of Earth in km
    double dLat = _degreesToRadians(endLat - startLat);
    double dLon = _degreesToRadians(endLon - startLon);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(startLat)) *
            cos(_degreesToRadians(endLat)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c; // Distance in km
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
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

    ref.listen(calculateRouteProvider, (previous, next) {
      next.whenOrNull(
        success: (tripId) {
          ref.read(getRouteListProvider.notifier).getRouteList(tripId: tripId);
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

    ref.listen(getRouteListProvider, (previous, next) {
      next.whenOrNull(
        data: (data) {
          if (data.routeList.isEmpty) {
            // * couldn't reach destination or any station
            errorPopupWidget(
              context: context,
              errorMessage:
                  'Unfortunately, the trip is unavailable due to the current battery and the number of stations present.',
              buttonLabel: 'retry',
              onRetry: () {
                setState(() {
                  _lastTappedField = ""; // Unselect destination
                  _destinationLocation = null; // Clear the selected destination
                  _destinationDescriptionController
                      .clear(); // Clear destination text field
                  _markers.removeWhere(
                      (marker) => marker.markerId.value == "destination");
                });
              },
            );
          } else {
            // * can reach destination without charges
            if (data.routeList.length == 1 &&
                data.routeList[0].chargingInfoList.isEmpty) {
              context.push(
                '/result-without-charges',
                extra: ResultWithoutChargesPageDataModel(
                    startLatLong: LatLng(
                      _startingLocation?.latitude ?? 0,
                      _startingLocation?.longitude ?? 0,
                    ),
                    destLatLong: LatLng(
                      _destinationLocation?.latitude ?? 0,
                      _destinationLocation?.longitude ?? 0,
                    ),
                    polylinePoints: _routePolylineCoordinates,
                    stationIdList: stationIdsOnRoute,
                    travelDurationInHours: travelDurationInHours ?? 0,
                    remainingBatteryAtDestination:
                        data.routeList[0].remainingBatteryAtDestination.toInt(),
                    totalDistance: totalDistance ?? 0),
              );
            } else {
              // * can reach destination with charges
              context.push(
                '/route-selection',
                extra: RouteSelectionPageDataModel(
                    tripResultData: data,
                    startLatLong: LatLng(
                      _startingLocation?.latitude ?? 0,
                      _startingLocation?.longitude ?? 0,
                    ),
                    destLatLong: LatLng(
                      _destinationLocation?.latitude ?? 0,
                      _destinationLocation?.longitude ?? 0,
                    ),
                    stationIdList: stationIdsOnRoute,
                    travelDurationInHours: travelDurationInHours ?? 0,
                    totalDistance: totalDistance ?? 0),
              );
            }
          }
        },
        error: (_) {
          errorPopupWidget(
              context: context,
              errorMessage:
                  'Getting route list from database have failed, Please retry again',
              buttonLabel: 'retry',
              onRetry: () => _onPressedPlanTrip);
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
