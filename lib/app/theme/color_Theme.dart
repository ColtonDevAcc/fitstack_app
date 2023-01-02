import 'package:FitStack/app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class FSColorTheme {
  Color primaryColor = Colors.redAccent;
  FSColorTheme();

  static const TextTheme textTheme = TextTheme();

  static ThemeData light(BuildContext context) {
    return ThemeData(
      iconTheme: const IconThemeData(color: Color.fromRGBO(112, 112, 112, 1)),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      primaryColor: const Color.fromRGBO(36, 42, 47, 1),
      colorScheme: const ColorScheme(
        surfaceVariant: Color.fromRGBO(242, 241, 254, 1),
        surface: Color.fromRGBO(244, 246, 246, 1),
        background: Color.fromRGBO(249, 249, 249, 1),
        brightness: Brightness.light,
        error: Color.fromRGBO(242, 82, 82, 1),
        onBackground: Color.fromRGBO(36, 42, 47, 1),
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color.fromRGBO(36, 42, 47, 1),
        secondaryContainer: Color.fromRGBO(234, 248, 253, 1),
        errorContainer: Color.fromRGBO(255, 244, 243, 1),
        onSurfaceVariant: Color.fromRGBO(140, 140, 140, 1),
        tertiaryContainer: Color.fromRGBO(226, 244, 226, 1),
        primary: Color.fromRGBO(36, 42, 47, 1),
        secondary: Color.fromRGBO(102, 159, 229, 1),
        tertiary: Color.fromRGBO(87, 54, 232, 1),
      ),
      textTheme: FSTextTheme.primaryTextTheme(context),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      iconTheme: const IconThemeData(color: Color.fromRGBO(112, 112, 112, 1)),
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      primaryColor: Colors.redAccent,
      colorScheme: const ColorScheme(
        surface: Colors.white,
        background: Color.fromRGBO(249, 249, 249, 1),
        brightness: Brightness.light,
        error: Color.fromRGBO(242, 82, 82, 1),
        onBackground: Colors.black,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        primary: Color.fromRGBO(254, 99, 71, 1),
        secondary: Color.fromRGBO(87, 54, 232, 1),
      ),
      textTheme: FSTextTheme.primaryTextTheme(context),
      primaryTextTheme: FSTextTheme.primaryTextTheme(context),
    );
  }
}
