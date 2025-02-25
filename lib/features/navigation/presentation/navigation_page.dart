import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({super.key});

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends ConsumerState<NavigationPage> {
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194), // Example: San Francisco
    zoom: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: GoogleMap(initialCameraPosition: _initialCameraPosition));
    return const Scaffold(
      body: Text("NAVIGATION PAGE"),
    );
  }
}
