import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.labelText, this.obscureText = false});

  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final decoration = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFD9D9D9),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius:
            BorderRadius.circular(10.0), // Ajusta el radio según sea necesario
      ),
      labelStyle: GoogleFonts.poppins(
        fontSize: textStyle.labelLarge?.fontSize,
        fontWeight: FontWeight.w600, 
        color: Colors.white
      ),
      labelText: labelText,
    );

    return TextField(obscureText: obscureText, decoration: decoration);
  }
}
