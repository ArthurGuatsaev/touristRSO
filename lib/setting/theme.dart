import 'package:flutter/material.dart';
import '../colors.dart';

ThemeData mobileTheme(Size size) {
  final width = size.width;
  return ThemeData(
    iconTheme: IconThemeData(size: width / 15, color: itemIconsColor),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
          fontSize: 16, color: bodyLargeColor, fontWeight: FontWeight.bold),
      bodySmall: const TextStyle(fontSize: 12),
      bodyMedium: const TextStyle(fontSize: 14),
      bodyLarge: TextStyle(
          fontSize: width / 58,
          color: bodyLargeColor,
          fontWeight: FontWeight.bold),
      displayLarge: TextStyle(
          fontSize: width / 20, color: titleColor, fontWeight: FontWeight.bold),
    ),
  );
}

ThemeData desctopTheme(Size size) {
  final width = size.width;
  return ThemeData(
    iconTheme: IconThemeData(size: width / 30, color: itemIconsColor),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
          fontSize: 16, color: bodyLargeColor, fontWeight: FontWeight.bold),
      bodySmall: const TextStyle(fontSize: 12),
      bodyMedium: const TextStyle(fontSize: 14),
      bodyLarge: TextStyle(
          fontSize: width / 58,
          color: bodyLargeColor,
          fontWeight: FontWeight.bold),
      displayLarge: TextStyle(fontSize: width / 30, color: titleColor),
    ),
  );
}

ThemeData createThemeData(Size size, bool isWeb) {
  if (isWeb) {
    return desctopTheme(size);
  } else {
    return mobileTheme(size);
  }
}
