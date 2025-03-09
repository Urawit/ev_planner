import 'package:flutter/material.dart';

Future<void> errorPopupWidget({
  required BuildContext context,
  required String errorMessage,
  String? additionalErrorMessage,
  String? buttonLabel,
  VoidCallback? onRetry,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('System Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(errorMessage),
              if (additionalErrorMessage != null) Text(additionalErrorMessage),
            ],
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  buttonLabel ?? 'Retry',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (onRetry != null) {
                    onRetry();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ),
        ],
      );
    },
  );
}
