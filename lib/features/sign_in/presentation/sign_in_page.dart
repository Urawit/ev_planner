import 'package:flutter/material.dart';

import '../../../shared/theme/ev_design_system.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO make String Constant
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text('Welcome to EV Planner',
                  style: EVDesignSystem.textStyles.headline1),
            ),
            const SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                )),
            const SizedBox(height: 20),
            const SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
