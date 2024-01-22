import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
    required this.counter,
    required this.total,
    this.textStyle,
    required this.label,
  });

  final int counter;
  final int total;
  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150.0,
              height: 150.0,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 8,
                value: total == 0 ? 0 : counter.toDouble() / total.toDouble(),
                backgroundColor: Colors.grey,
              ),
            ),
            Text(
              total == 0
                  ? '0%'
                  : '${(counter.toDouble() / total.toDouble() * 100).toStringAsFixed(2)}%',
              style: textStyle,
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          label,
          style: textStyle?.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
