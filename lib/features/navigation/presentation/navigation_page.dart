import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({super.key});

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends ConsumerState<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("NavigationPage"
    ),);
  }
}