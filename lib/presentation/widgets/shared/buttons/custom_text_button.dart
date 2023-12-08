import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: GoogleFonts.poppins(
            fontSize: textStyle.labelLarge?.fontSize,
            fontWeight: FontWeight.w600, 
            color: textStyle.labelLarge?.color
          )),
    );
  }
}
