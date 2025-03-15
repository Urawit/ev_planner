import 'package:flutter/material.dart';

class TextStyles {
  const TextStyles();

  TextStyle get headline1 =>
      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  TextStyle get headline2 =>
      const TextStyle(fontSize: 23, fontWeight: FontWeight.w900);
  TextStyle get headline3 =>
      const TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
  TextStyle get headline4 =>
      const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  TextStyle get normal1 =>
      const TextStyle(fontSize: 17, fontWeight: FontWeight.normal);
  TextStyle get normal2 => const TextStyle(
      fontSize: 17, fontWeight: FontWeight.normal, color: Colors.blueGrey);
  TextStyle get normal3 => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.blueGrey);
  TextStyle get description1 => const TextStyle(
      fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black);
  TextStyle get description2 => const TextStyle(
      fontSize: 17, fontWeight: FontWeight.normal, color: Colors.green);
}
