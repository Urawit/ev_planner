import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends ConsumerStatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends ConsumerState<GoogleMapWidget> {
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(initialCameraPosition: _initialCameraPosition));
  }
}
