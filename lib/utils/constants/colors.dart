import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // App basic colors
  static const Color primary = Color(0xFF00A884);
  static const Color secondary = Color(0xFF00A884);
  static const Color accent = Color(0xFF00A884);

  // Gradient colors
  static Gradient kDarkGradientBackgroundColor = LinearGradient(
    colors: [
      blackBg, // bottom color
      blackBg.withOpacity(0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0.70, 1.0],
  );

  static Gradient kLightGradientBackgroundColor = LinearGradient(
    colors: [
      whiteBg, // bottom color
      whiteBg.withOpacity(0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0.70, 1.0],
  );

  // Text colors

  // Background colors
  static const Color blackBg = Color(0xff121b22);
  static const Color whiteBg = Color(0xFFFFFFFF);

  // Background container color
  static const Color pineGreen = Color(0xFF008069);

  // Button colors

  //Border colors

  // Error and validation color

  // Neutral shades
  static const Color black = Color(0xFF000000);
  static const Color darkGray = Color(0xFF333333);
  static const Color lightGray = Color(0xFFBBBBBB);
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyBg = Color(0XFF1F2C34);
}
