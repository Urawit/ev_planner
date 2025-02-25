import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/ev_design_system.dart';

class CustomTextField extends ConsumerWidget {
  final TextEditingController controller;
  final String label;
  final StateProvider<String?> errorProvider;

  const CustomTextField({
    required this.controller,
    required this.label,
    required this.errorProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(errorProvider);

    return SizedBox(
      width: 327,
      child: TextField(
        onChanged: (_) {
          ref.read(errorProvider.notifier).state = null;
        },
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: errorText != null ? Colors.red : Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: EVDesignSystem.colors.orange,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          errorText: errorText,
        ),
      ),
    );
  }
}
