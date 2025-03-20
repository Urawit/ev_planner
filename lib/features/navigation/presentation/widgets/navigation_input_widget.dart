import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/features/vehicle_info/logic/vehicle_provider.dart';
import '../../../../shared/theme/ev_design_system.dart';
import '../../../sign_in/presentation/logic/sign_in_provider.dart';
import '../logic/calculate_route/calculate_route_provider.dart';

class NavigationInputWidget extends ConsumerStatefulWidget {
  final VoidCallback onStartingLocationTap;
  final VoidCallback onDestinationLocationTap;
  final VoidCallback onPressedPlanTrip;
  final TextEditingController locationDescriptionController;
  final TextEditingController destinationDescriptionController;
  final String lastTappedField;

  const NavigationInputWidget({
    super.key,
    required this.onStartingLocationTap,
    required this.onDestinationLocationTap,
    required this.onPressedPlanTrip,
    required this.locationDescriptionController,
    required this.destinationDescriptionController,
    required this.lastTappedField,
  });

  @override
  NavigationInputWidgetState createState() => NavigationInputWidgetState();
}

class NavigationInputWidgetState extends ConsumerState<NavigationInputWidget> {
  String carBrand = '';
  String carModel = '';

  double batteryPercentage = 50.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(vehicleProvider.notifier).getVehicleList();
    });
  }

  void _findCarInfo(List<dynamic> vehicleList) {
    final userContext = ref.read(userContextProvider);

    for (var vehicle in vehicleList) {
      for (var model in vehicle.carModels) {
        if (model.modelId == userContext?.carModelId) {
          setState(() {
            carBrand = vehicle.carBrandName;
            carModel = model.modelName;
          });
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final vehicleState = ref.watch(vehicleProvider);

    vehicleState.whenOrNull(
      data: (vehicleList) {
        _findCarInfo(vehicleList);
      },
    );

    return Padding(
      padding: const EdgeInsets.only(top: 55, left: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField(
              label: "Starting Location",
              controller: widget.locationDescriptionController,
              isSelected: widget.lastTappedField == "starting",
              onTap: widget.onStartingLocationTap,
              icon: Icons.location_on,
            ),
            const SizedBox(height: 8),
            _buildTextField(
              label: "Destination",
              controller: widget.destinationDescriptionController,
              isSelected: widget.lastTappedField == "destination",
              onTap: widget.onDestinationLocationTap,
              icon: Icons.flag,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.directions_car, color: Colors.blue),
                const SizedBox(width: 8),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Brand: ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                      TextSpan(
                        text: carBrand,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Model: ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                      TextSpan(
                        text: carModel,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                SizedBox(width: 6),
                Text(
                  'Select your current car battery',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11, right: 11),
              child: Row(
                children: [
                  Image.asset("assets/images/battery_icon.png", scale: 4),
                  Expanded(
                    child: Slider(
                      activeColor: EVDesignSystem.colors.orange,
                      value: batteryPercentage,
                      min: 20,
                      max: 100,
                      divisions: 100,
                      label: '${batteryPercentage.round()}%',
                      onChanged: (value) {
                        setState(() {
                          batteryPercentage = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    '${batteryPercentage.round()}%',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEB7A29),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: widget
                            .locationDescriptionController.text.isNotEmpty &&
                        widget.destinationDescriptionController.text.isNotEmpty
                    ? () {
                        widget.onPressedPlanTrip();
                        ref.read(currentBatteryProvider.notifier).state =
                            batteryPercentage;
                      }
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/plan_trip_icon.png", scale: 4),
                    const SizedBox(width: 10),
                    const Text('plan the trip'),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required bool isSelected,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.black),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                controller.text.isEmpty ? label : controller.text,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
