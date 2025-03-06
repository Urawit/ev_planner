import 'package:flutter/material.dart';

class NavigationInputWidget extends StatefulWidget {
  final VoidCallback onStartingLocationTap;
  final VoidCallback onDestinationLocationTap;
  final TextEditingController locationDescriptionController;
  final TextEditingController destinationDescriptionController;
  final String lastTappedField;

  const NavigationInputWidget({
    super.key,
    required this.onStartingLocationTap,
    required this.onDestinationLocationTap,
    required this.locationDescriptionController,
    required this.destinationDescriptionController,
    required this.lastTappedField,
  });

  @override
  State<NavigationInputWidget> createState() => _NavigationInputWidgetState();
}

class _NavigationInputWidgetState extends State<NavigationInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 5, right: 5),
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
