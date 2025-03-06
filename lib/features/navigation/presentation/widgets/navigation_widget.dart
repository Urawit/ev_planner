import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  NavigationWidgetState createState() => NavigationWidgetState();
}

class NavigationWidgetState extends State<NavigationWidget> {
  LatLng? _currentLocation;
  LatLng? _destination;

  void _updateLocation(LatLng latLng, bool isCurrentLocation) {
    setState(() {
      if (isCurrentLocation) {
        _currentLocation = latLng;
      } else {
        _destination = latLng;
      }
    });
  }

  void _updateAddress(String address, bool isCurrentLocation) async {
    List<Location> locations = await locationFromAddress(address);
    if (locations.isNotEmpty) {
      _updateLocation(
          LatLng(locations.first.latitude, locations.first.longitude),
          isCurrentLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        GoogleMapWidget(),
        // NavigationInputWidget(onAddressEntered: _updateAddress),
      ],
    );
  }
}
