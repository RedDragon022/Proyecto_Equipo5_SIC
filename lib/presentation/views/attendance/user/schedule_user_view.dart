import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';

class ScheduleUserView extends StatelessWidget {
  const ScheduleUserView({super.key});

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