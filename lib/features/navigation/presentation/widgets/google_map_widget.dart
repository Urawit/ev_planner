import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'navigation_input_widget.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends ConsumerState<GoogleMapWidget> {
  GoogleMapController? _mapController;
  LatLng? _startingLocation;
  String _lastTappedField = "destination";
  final Set<Marker> _markers = {};

  final TextEditingController _locationDescriptionController =
      TextEditingController();
  final TextEditingController _destinationDescriptionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkAndRequestPermission();
    _getCurrentLocation();
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
    if (!hasPermission) return;

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
    if (_lastTappedField.isEmpty)
      return; // Prevent setting a marker if no field is selected

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
            locationDescriptionController: _locationDescriptionController,
            destinationDescriptionController: _destinationDescriptionController,
            lastTappedField: _lastTappedField, // Pass state to UI
          ),
        ],
      ),
    );
  }
}
