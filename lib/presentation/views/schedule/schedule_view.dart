import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.calendar_month_sharp)),
        const CustomSchedule(),
      ],
    );
  }
}