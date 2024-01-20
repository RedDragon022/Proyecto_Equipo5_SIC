import 'package:flutter/material.dart';


class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({
    super.key,
    required this.attendances,
    required this.totalAttendances,
    required this.textStyle,
  });

  final int attendances;
  final int totalAttendances;
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
                value: totalAttendances == 0
                    ? 0
                    : attendances.toDouble() / totalAttendances.toDouble(),
                backgroundColor: Colors.grey,
              ),
            ),
            Text(
              totalAttendances == 0
                  ? '0%'
                  : '${(attendances.toDouble() / totalAttendances.toDouble() * 100).toStringAsFixed(2)}%',
              style: textStyle,
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          '$attendances/$totalAttendances Asistencias semanales',
          style: textStyle?.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
