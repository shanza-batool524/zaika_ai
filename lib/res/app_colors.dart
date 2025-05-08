import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color button = Color(0xFF7B6F72);
  static const Color secondary = Color(0xFF222222);
  static const Color tertiary = Color(0xFFEEA4CE);
  static const Color tertiary_light = Color(0xFFf9ebf8);
  static const Color purple = Color(0xFF92A3FD);
  static const Color blue = Color(0xFF9DCEFF);
  static const Color grey = Color(0xFFDDDADA);
  static const Color green = Color(0xFF4CAF50);
  static const Color black = Color(0xFF222222);
  static const Color surface = Color(0xFF121212);
  static const Color error = Color(0xFFCF6679);
  static const Color white = Color(0xFFFFFFFF);
  static const Color splash = Color(0xFF4058A0);
  static Color lightWhite = const Color(0xFFFFFFFF);
  static const Color onError = Color(0xFF000000);
  static const Color text = Color(0xFF7B6F72);
  static const Color text_field = Color(0xffF7F8F8);
  static const Color sec_text = Color(0xffADA4A5);
  static const Color orange = Color(0xffFF6339);
  static const Color brown = Color(0xff462009);
  static LinearGradient gradient = LinearGradient(
    colors: [secondary, tertiary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
