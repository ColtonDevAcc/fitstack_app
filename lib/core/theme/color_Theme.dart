import 'package:fitstackapp/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      textTheme: textTheme,
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
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        headline4: GoogleFonts.bebasNeue(
          textStyle: textTheme.headline4,
          color: Theme.of(context).colorScheme.primary,
          fontSize: 12,
        ),
        headline3: GoogleFonts.montserrat(
          textStyle: textTheme.headline1,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          fontSize: 18,
        ),
        button: GoogleFonts.montserrat(
          textStyle: textTheme.headline4,
          color: Theme.of(context).colorScheme.primary,
          fontSize: 15,
        ),
        bodyText1: GoogleFonts.bebasNeue(
          textStyle: textTheme.headline4,
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 10,
        ),
        bodyText2: GoogleFonts.montserrat(
          textStyle: textTheme.headline4,
          color: Colors.black,
          fontSize: 20,
        ),
        subtitle1: GoogleFonts.montserrat(
          textStyle: textTheme.headline4,
          fontSize: 16,
          color: Colors.black,
        ),
        subtitle2: GoogleFonts.montserrat(
          textStyle: textTheme.headline4,
          fontSize: 14,
          color: Colors.black,
        ),
        headline6: GoogleFonts.montserrat(
          textStyle: textTheme.headline4,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      primaryTextTheme: FSTextTheme.Primary_Text_Theme(context),
    );
  }
}
