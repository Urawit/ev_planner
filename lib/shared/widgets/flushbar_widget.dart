import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushbar(
    {required BuildContext context,
    required String title,
    required String message,
    required Color backgroundColor}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Flushbar(
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: backgroundColor,
      titleColor: Colors.white,
      messageColor: Colors.white,
    ).show(context);
  });
}
