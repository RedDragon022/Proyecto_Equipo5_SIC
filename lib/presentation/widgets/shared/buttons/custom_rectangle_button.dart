import 'package:flutter/material.dart';

class CustomRectangleButton extends StatelessWidget {
  const CustomRectangleButton(
      {super.key, this.onPressed, required this.text, this.backgroundColor, this.textColor});

  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    //final primaryColor = Theme.of(context).primaryColor;
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              elevation: 0,
              alignment: Alignment.center,
              backgroundColor: backgroundColor ?? const Color(0xFFB356FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          child: Text(
            text,
            style: textStyle.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.white), // O FontWeight.bold para negrita
          )),
    );
  }
}
