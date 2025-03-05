import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavePage extends ConsumerStatefulWidget {
  const SavePage({super.key});

  @override
  SavePageState createState() => SavePageState();
}

class SavePageState extends ConsumerState<SavePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("SAVE PAGE"),
    );
  }
}
