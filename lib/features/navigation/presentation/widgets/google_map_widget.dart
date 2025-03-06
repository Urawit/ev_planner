import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends ConsumerState<GoogleMapWidget> {
  GoogleMapController? _mapController;
  LatLng? _startingLocation;
  LatLng? _destination;
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
      _markers.add(
        Marker(
          markerId: const MarkerId("startingLocation"),
          position: _startingLocation!,
          infoWindow: const InfoWindow(title: "Starting Location"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
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

  void _onMapTapped(LatLng latLng) {
    setState(() {
      if (_startingLocation == null) {
        _startingLocation = latLng;
        _getAddressFromLatLng(latLng, _locationDescriptionController);
        _markers.add(
          Marker(
            markerId: const MarkerId("startingLocation"),
            position: latLng,
            infoWindow: const InfoWindow(title: "Starting Location"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ),
        );
      } else if (_destination == null) {
        _destination = latLng;
        _getAddressFromLatLng(latLng, _destinationDescriptionController);
        _markers.add(
          Marker(
            markerId: const MarkerId("destination"),
            position: latLng,
            infoWindow: const InfoWindow(title: "Destination"),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        );
      }
    });
  }

  void _onStartingLocationTap() {
    setState(() {
      _startingLocation = null;
      _markers
          .removeWhere((marker) => marker.markerId.value == "startingLocation");
      _locationDescriptionController.clear();
    });
  }

  void _onDestinationLocationTap() {
    setState(() {
      _destination = null;
      _markers.removeWhere((marker) => marker.markerId.value == "destination");
      _destinationDescriptionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map Location Selector")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: _onStartingLocationTap,
              child: TextField(
                controller: _locationDescriptionController,
                decoration: const InputDecoration(
                  labelText: "Starting Location Description",
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: _onDestinationLocationTap,
              child: TextField(
                controller: _destinationDescriptionController,
                decoration: const InputDecoration(
                  labelText: "Destination Description",
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
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
        ],
      ),
    );
  }
}
