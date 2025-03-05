import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  NavigationWidgetState createState() => NavigationWidgetState();
}

class NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("navigation"),
    );
  }
}
