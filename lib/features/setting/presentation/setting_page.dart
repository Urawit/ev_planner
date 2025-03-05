import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends ConsumerState<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("SETTING PAGE"),
    );
  }
}
