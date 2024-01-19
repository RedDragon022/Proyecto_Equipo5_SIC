import 'package:flutter/material.dart';

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
          style: textStyle.labelLarge?.copyWith(
              fontWeight: FontWeight.w600, color: textStyle.labelLarge?.color)),
    );
  }
}
