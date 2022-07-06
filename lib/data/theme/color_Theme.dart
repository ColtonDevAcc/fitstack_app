import 'package:fitstackapp/data/theme/text_theme.dart';
import 'package:flutter/material.dart';

class FSColorTheme {
  Color primaryColor = Colors.redAccent;
  FSColorTheme();

  static final TextTheme textTheme = TextTheme();

  static ThemeData Light(BuildContext context) {
    return ThemeData(
      iconTheme: IconThemeData(color: Color.fromRGBO(112, 112, 112, 1)),
      backgroundColor: Color.fromARGB(249, 249, 249, 249),
      primaryColor: Color.fromRGBO(254, 99, 71, 1),
      colorScheme: ColorScheme(
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
      textTheme: FSTextTheme.Primary_Text_Theme(context),
    );
  }

  static ThemeData Dark(context) {
    final textTheme = Theme.of(context).textTheme;

    return ThemeData(
      iconTheme: IconThemeData(color: Color.fromRGBO(112, 112, 112, 1)),
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      primaryColor: Colors.redAccent,
      colorScheme: ColorScheme(
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
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }
}
