import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/presentation/providers/providers.dart';
import '../../../widgets/widgets.dart';

class ScheduleUserView extends ConsumerWidget {
  const ScheduleUserView({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.watch(scheduleProvider.notifier).getScheduleByUserId(userId);
    
    return Column(
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.calendar_month_sharp)),
        const CustomSchedule(),
      ],
    );
  }
}
