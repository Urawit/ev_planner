import 'package:flutter/material.dart';

import 'widgets.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  NavigationWidgetState createState() => NavigationWidgetState();
}

class NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        GoogleMapWidget(),
      ],
    );
  }
}
