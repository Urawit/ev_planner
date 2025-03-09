import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'theme/ev_design_system.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/error404.png")),
          const SizedBox(height: 43),
          Text("Please allow the location!",
              style: EVDesignSystem.textStyles.headline1),
          const SizedBox(height: 8),
          Text("our application can't function",
              style: EVDesignSystem.textStyles.normal2),
          const SizedBox(height: 6),
          Text("without your location permission",
              style: EVDesignSystem.textStyles.normal2),
          const SizedBox(height: 64),
          ElevatedButton(
            onPressed: () => context.go('/navigation'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Back to Navigation Page",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
