import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ColorScheme lightColors = ColorScheme(
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
);

const TextTheme baseTextTheme = TextTheme();

TextTheme lightTextTheme = GoogleFonts.latoTextTheme().copyWith(
  headline1: GoogleFonts.bebasNeue(
    textStyle: baseTextTheme.headline4,
    color: lightColors.primary,
  ),
  headline2: GoogleFonts.bebasNeue(
    textStyle: baseTextTheme.headline4,
    color: lightColors.primary,
  ),
  headline3: GoogleFonts.montserrat(
    textStyle: baseTextTheme.headline3,
    fontWeight: FontWeight.bold,
    color: lightColors.primary,
    fontSize: 18,
  ),
  headline4: GoogleFonts.bebasNeue(
    textStyle: baseTextTheme.headline4,
    color: lightColors.primary,
  ),
  headline5: GoogleFonts.bebasNeue(
    textStyle: baseTextTheme.headline4,
    color: lightColors.primary,
  ),
  button: GoogleFonts.montserrat(
    textStyle: baseTextTheme.button,
    color: lightColors.primary,
    fontSize: 15,
  ),
  bodyText1: GoogleFonts.bebasNeue(
    textStyle: baseTextTheme.bodyText1,
    color: lightColors.onBackground,
    fontSize: 10,
  ),
  bodyText2: GoogleFonts.montserrat(
    textStyle: baseTextTheme.bodyText2,
    color: Colors.black,
    fontSize: 20,
  ),
  subtitle1: GoogleFonts.montserrat(
    textStyle: baseTextTheme.subtitle1,
    fontSize: 16,
    color: Colors.black,
  ),
  subtitle2: GoogleFonts.montserrat(
    textStyle: baseTextTheme.subtitle2,
    fontSize: 14,
    color: Colors.black,
  ),
);

ThemeData lightTheme = ThemeData(
  iconTheme: const IconThemeData(color: Color.fromRGBO(112, 112, 112, 1)),
  backgroundColor: const Color.fromARGB(249, 249, 249, 249),
  primaryColor: const Color.fromRGBO(254, 99, 71, 1),
  colorScheme: lightColors,
  textTheme: lightTextTheme,
);
