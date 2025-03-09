import 'package:flutter/material.dart';

class TextStyles {
  const TextStyles();

  TextStyle get headline1 =>
      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  TextStyle get normal1 =>
      const TextStyle(fontSize: 17, fontWeight: FontWeight.normal);
  TextStyle get normal2 => const TextStyle(
      fontSize: 17, fontWeight: FontWeight.normal, color: Colors.blueGrey);
}
