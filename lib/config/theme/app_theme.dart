import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() {
 
    return ThemeData(
      colorSchemeSeed: const Color(0xFFB356FF),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily
    );
  }
}