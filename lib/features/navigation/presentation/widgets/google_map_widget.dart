import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../shared/widgets/error_popup_widget.dart';
//TODO DELETE THIS
import '../../../sign_in/data/models/sign_in_input_model.dart';
import '../../../sign_in/presentation/logic/sign_in_provider.dart';

import '../../domain/entities/entities.dart';
import '../logic/logic.dart';
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
  String _lastTappedField = "destination";
  final Set<Marker> _markers = {};

  final TextEditingController _locationDescriptionController =
      TextEditingController();
  final TextEditingController _destinationDescriptionController =
      TextEditingController();

  final ValueNotifier<bool> isStationDetailWidget = ValueNotifier(false);
  final ValueNotifier<String?> selectedStationId = ValueNotifier(null);

  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _checkAndRequestPermission();
    _getCurrentLocation();
    _getStationList();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _getStationList() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(stationProvider.notifier).getStationList();

      //TODO DELETE THIS
      ref.read(signInProvider.notifier).signIn(
            signInInput:
                SignInInputModel(email: 'admin@gmail.com', password: '1234'),
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
          position: LatLng(station.lat, station.long),
          infoWindow: const InfoWindow(
            //TODO SHOULD ADD STATION NAME?
            // title: station.stationName,
            snippet: "Tap for details",
          ),
          onTap: () {
            isStationDetailWidget.value = !isStationDetailWidget.value;
            selectedStationId.value = station.stationId;
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

    setState(() {
      _startingLocation = LatLng(position.latitude, position.longitude);
      _getAddressFromLatLng(_startingLocation!, _locationDescriptionController);
      _updateMarker("startingLocation", _startingLocation!,
          BitmapDescriptor.hueGreen, "Starting Location");
      _moveCameraToLocation(_startingLocation!);
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
    if (_lastTappedField.isEmpty || isStationDetailWidget.value) {
      return; // Prevent setting a marker if no field is selected
    }

    setState(() {
      if (_lastTappedField == "starting") {
        _startingLocation = latLng;
        _getAddressFromLatLng(latLng, _locationDescriptionController);
        _updateMarker("startingLocation", latLng, BitmapDescriptor.hueGreen,
            "Starting Location");
      } else if (_lastTappedField == "destination") {
        _getAddressFromLatLng(latLng, _destinationDescriptionController);
        _updateMarker(
            "destination", latLng, BitmapDescriptor.hueRed, "Destination");
      }

      // Reset selection after setting a marker
      _lastTappedField = "";
    });
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

  @override
  Widget build(BuildContext context) {
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

    final googleMapPadding = ref.watch(googleMapPaddingProvider);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: googleMapPadding),
            child: GoogleMap(
              scrollGesturesEnabled: !isStationDetailWidget.value,
              zoomGesturesEnabled: !isStationDetailWidget.value,
              rotateGesturesEnabled: !isStationDetailWidget.value,
              tiltGesturesEnabled: !isStationDetailWidget.value,
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
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isStationDetailWidget,
            builder: (context, isStationDetailWidgetVisible, child) {
              if (isStationDetailWidgetVisible) {
                return ValueListenableBuilder<String?>(
                  valueListenable: selectedStationId,
                  builder: (context, stationId, child) {
                    Marker? selectedMarker = _markers.firstWhere(
                      (marker) => marker.markerId.value == stationId,
                    );

                    _mapController?.animateCamera(
                      CameraUpdate.newLatLngZoom(
                          LatLng(
                            selectedMarker.position.latitude + 0.00025,
                            selectedMarker.position.longitude,
                          ),
                          18),
                    );

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref.read(googleMapPaddingProvider.notifier).state = 515.0;
                    });

                    if (stationId != null) {
                      _animationController.forward();

                      return SlideTransition(
                        position: _slideAnimation,
                        child: StationDetailWidget(
                          stationId: stationId,
                          onPressedBackButton: () {
                            _mapController?.animateCamera(
                              CameraUpdate.newLatLngZoom(
                                  _startingLocation ?? const LatLng(0, 0),
                                  12.0),
                            );
                            isStationDetailWidget.value =
                                !isStationDetailWidget.value;

                            _animationController.reverse();

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ref
                                  .read(googleMapPaddingProvider.notifier)
                                  .state = 0.0;
                            });
                          },
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              } else {
                return NavigationInputWidget(
                  onStartingLocationTap: _onStartingLocationTap,
                  onDestinationLocationTap: _onDestinationLocationTap,
                  locationDescriptionController: _locationDescriptionController,
                  destinationDescriptionController:
                      _destinationDescriptionController,
                  lastTappedField: _lastTappedField,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
