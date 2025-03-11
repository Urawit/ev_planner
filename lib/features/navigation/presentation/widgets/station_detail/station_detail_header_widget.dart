import 'package:flutter/material.dart';

class StationDetailHeaderWidget extends StatelessWidget {
  const StationDetailHeaderWidget(
      {super.key, required this.onPressedBackButton});

  final VoidCallback onPressedBackButton;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 500,
                color: Colors.green,
                child: Column(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: onPressedBackButton,
                        padding: const EdgeInsets.only(right: 330, top: 20))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
