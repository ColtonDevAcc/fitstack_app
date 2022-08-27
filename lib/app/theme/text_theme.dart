import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FSTextTheme {
  static Primary_Text_Theme(BuildContext context) {
    return GoogleFonts.latoTextTheme().copyWith(
      titleLarge: GoogleFonts.bebasNeue(),
      titleMedium: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.normal),
      titleSmall: GoogleFonts.montserrat(),
      headlineLarge: GoogleFonts.bebasNeue(),
      headlineMedium: GoogleFonts.bebasNeue(),
      headlineSmall: GoogleFonts.bebasNeue(),
      // bodyLarge:  GoogleFonts.bebasNeue()
      bodyMedium: GoogleFonts.montserrat(),
      labelLarge: GoogleFonts.questrial(
        letterSpacing: 1,
      ),
      labelMedium: GoogleFonts.questrial(
        letterSpacing: 1,
      ),
      labelSmall: GoogleFonts.questrial(
        letterSpacing: 1,
      ),
    );
  }
}
