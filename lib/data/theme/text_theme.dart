import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FSTextTheme {
  static Primary_Text_Theme(BuildContext context) {
    final TextTheme textTheme = TextTheme();

    return GoogleFonts.latoTextTheme().copyWith(
        titleLarge: GoogleFonts.bebasNeue(),
        titleMedium: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.normal),
        titleSmall: GoogleFonts.montserrat(),
        // bodyLarge:  GoogleFonts.bebasNeue()
        bodyMedium: GoogleFonts.montserrat());
  }
}
