import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  AppTheme copyWith({bool? isDarkMode}) =>
      AppTheme(isDarkMode: isDarkMode ?? this.isDarkMode);

  ThemeData getTheme() {
    return ThemeData(
        colorSchemeSeed: const Color(0xFFB356FF),
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: isDarkMode ? Brightness.dark : Brightness.light);
  }
}
