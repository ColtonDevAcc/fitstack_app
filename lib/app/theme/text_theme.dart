import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FSTextTheme {
  static Primary_Text_Theme(BuildContext context) {
    return GoogleFonts.latoTextTheme().copyWith(
      titleLarge: GoogleFonts.bebasNeue(),
      titleMedium: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.normal),
      titleSmall: GoogleFonts.roboto(),
      headlineLarge: GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      headlineSmall: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      bodyLarge: GoogleFonts.roboto(fontSize: 16),
      bodyMedium: GoogleFonts.roboto(),
      bodySmall: GoogleFonts.roboto(),
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
