import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/ev_design_system.dart';

class PasswordTextField extends ConsumerWidget {
  final TextEditingController controller;
  final String label;
  final StateProvider<String?> errorProvider;
  final StateProvider<bool> obscureProvider;

  const PasswordTextField({
    required this.controller,
    required this.label,
    required this.errorProvider,
    required this.obscureProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(errorProvider);
    final isObscure = ref.watch(obscureProvider);

    return SizedBox(
      width: 327,
      child: TextField(
        onChanged: (_) {
          ref.read(errorProvider.notifier).state = null;
        },
        controller: controller,
        obscureText: isObscure,
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
          errorMaxLines: 2,
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              ref.read(obscureProvider.notifier).state = !isObscure;
            },
          ),
        ),
      ),
    );
  }
}
