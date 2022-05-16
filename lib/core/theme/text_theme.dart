import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FSTextTheme extends TextTheme {
  static Primary_Text_Theme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GoogleFonts.latoTextTheme().copyWith(
      headline4: GoogleFonts.bebasNeue(
        textStyle: TextStyle(),
        color: Theme.of(context).colorScheme.primary,
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
    );
  }
}


// backgroundColor: Apptheme.mainBackgroundColor,
//         textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
//           headline4: GoogleFonts.bebasNeue(
//             textStyle: textTheme.headline4,
//             color: Apptheme.mainButonColor,
//           ),
//           headline3: GoogleFonts.montserrat(
//             textStyle: textTheme.headline1,
//             fontWeight: FontWeight.bold,
//             color: Apptheme.mainButonColor,
//             fontSize: 18,
//           ),
//           button: GoogleFonts.montserrat(
//             textStyle: textTheme.headline4,
//             color: Apptheme.mainButonColor,
//             fontSize: 15,
//           ),
//           bodyText1: GoogleFonts.bebasNeue(
//             textStyle: textTheme.headline4,
//             color: Apptheme.mainTextColor,
//             fontSize: 10,
//           ),
//           bodyText2: GoogleFonts.montserrat(
//             textStyle: textTheme.headline4,
//             color: Colors.black,
//             fontSize: 20,
//           ),
//           subtitle1: GoogleFonts.montserrat(
//             textStyle: textTheme.headline4,
//             fontSize: 16,
//             color: Colors.black,
//           ),
//           subtitle2: GoogleFonts.montserrat(
//             textStyle: textTheme.headline4,
//             fontSize: 14,
//             color: Colors.black,
//           ),
//           headline6: GoogleFonts.montserrat(
//             textStyle: textTheme.headline4,
//             fontSize: 15,
//             color: Colors.black,
//           ),
//         ),
//       ),