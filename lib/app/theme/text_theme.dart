import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class FSTextTheme {
  static TextTheme primaryTextTheme(BuildContext context) {
    return GoogleFonts.latoTextTheme().copyWith(
      titleLarge: GoogleFonts.bebasNeue(letterSpacing: .8, color: const Color.fromRGBO(36, 42, 47, 1)),
      titleMedium: GoogleFonts.bebasNeue(fontSize: 24, fontWeight: FontWeight.normal),
      titleSmall: GoogleFonts.bebasNeue(
        fontSize: 10,
        color: const Color.fromRGBO(159, 159, 159, 1),
        letterSpacing: .8,
      ),
      headlineLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold, color: const Color.fromRGBO(153, 153, 153, 1)),
      headlineMedium: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: const Color.fromRGBO(153, 153, 153, 1)),
      headlineSmall: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.normal, color: const Color.fromRGBO(153, 153, 153, 1)),
      bodyLarge: GoogleFonts.roboto(color: const Color.fromRGBO(153, 153, 153, 1)),
      bodyMedium: GoogleFonts.roboto(color: const Color.fromRGBO(153, 153, 153, 1)),
      bodySmall: GoogleFonts.roboto(color: const Color.fromRGBO(153, 153, 153, 1)),
      labelLarge: GoogleFonts.roboto(
        letterSpacing: 1,
      ),
      labelMedium: GoogleFonts.roboto(
        letterSpacing: 1,
      ),
      labelSmall: GoogleFonts.roboto(
        letterSpacing: 1,
      ),
    );
  }
}
