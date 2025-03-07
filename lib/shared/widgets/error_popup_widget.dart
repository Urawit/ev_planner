import 'package:flutter/material.dart';

Future<void> errorPopupWidget(
    {required BuildContext context,
    required String errorMessage,
    String? additionalErrorMessage}) async {
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
            width: double.infinity, // Make button full width
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0), // Add padding
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set blue color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                      vertical: 16), // Make it bigger
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      );
    },
  );
}
