import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class NavigationInputWidget extends StatefulWidget {
  final Function(String, bool) onAddressEntered;

  const NavigationInputWidget({super.key, required this.onAddressEntered});

  @override
  State<NavigationInputWidget> createState() => _NavigationInputWidgetState();
}

class _NavigationInputWidgetState extends State<NavigationInputWidget> {
  final TextEditingController _currentLocationController =
      TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  void _handleAddressSubmit(String address, bool isCurrentLocation) async {
    List<Location> locations = await locationFromAddress(address);
    if (locations.isNotEmpty) {
      widget.onAddressEntered(address, isCurrentLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 5),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 240,
              width: 340,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _currentLocationController,
                          decoration: const InputDecoration(
                              labelText: "Current Location"),
                          onSubmitted: (value) =>
                              _handleAddressSubmit(value, true),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _destinationController,
                          decoration:
                              const InputDecoration(labelText: "Destination"),
                          onSubmitted: (value) =>
                              _handleAddressSubmit(value, false),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
