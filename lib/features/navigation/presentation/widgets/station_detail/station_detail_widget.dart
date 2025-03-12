import 'package:flutter/material.dart';

import 'station_detail_header_widget.dart';

class StationDetailWidget extends StatelessWidget {
  const StationDetailWidget(
      {required this.stationId, required this.onPressedBackButton, super.key});

  final String stationId;
  final VoidCallback onPressedBackButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                height: 80,
              ),
            ),
          ],
        ),
        const SizedBox(height: 180),
        const Divider(
          color: Colors.black,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 600,
                    color: Colors.white,
                    child: Column(
                      children: [
                        StationDetailHeaderWidget(
                            stationId: stationId,
                            onPressedBackButton: onPressedBackButton),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
