import 'package:flutter/material.dart';

class StationDetailLoadingView extends StatelessWidget {
  const StationDetailLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Loading station details...',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
