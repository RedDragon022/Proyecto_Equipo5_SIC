import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      this.errorText});

  final String labelText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius:
          BorderRadius.circular(10.0), // Ajusta el radio según sea necesario
    );

    final errorBorder =
        border.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 1.5));

    final labelStyle = textStyle.labelLarge?.copyWith(
            color: Colors.grey.shade100);

    final decoration = InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade500,
        border: border,
        errorBorder: errorBorder,
        labelStyle: labelStyle?.copyWith(fontWeight: FontWeight.w600),
        labelText: labelText,
        errorText: errorText,
        errorStyle: labelStyle?.copyWith(color: Colors.red, fontWeight: FontWeight.w600)
    );

    return TextFormField(
      obscureText: obscureText,
      decoration: decoration,
      onChanged: onChanged,
      validator: validator,      
      style: labelStyle?.copyWith(fontWeight: FontWeight.w300),
    );
  }
}
