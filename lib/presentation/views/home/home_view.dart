import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/helpers/day_helper.dart';
import 'package:teachersguard/presentation/providers/providers.dart';
import 'package:teachersguard/presentation/widgets/widgets.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    final schedules = ref.watch(scheduleProvider);

    final currentDay =
        DayHelper.convertDartDayToBackendDay(0);

 final currentSchedules = schedules
    .where((schedule) =>
        schedule.dayOfWeek.contains(currentDay))
    .toList();

    return Column(
      children: [
        HeaderHome(
          name: user.name,
          imageUrl: user.imageProfile,
        ),
        Flexible(
          child: ListView.separated(
              itemCount: currentSchedules.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              separatorBuilder: (context, index) => const SizedBox(height: 30),
              itemBuilder: (context, index) {
                final currentSchedule = currentSchedules[index];
                
                return ClassBox(
                    classLabel: 'Clase Actual',
                    classRoomLabel: currentSchedule.place.name,
                    hourLabel: '${currentSchedule.begin}-${currentSchedule.end}',
                  );
                
              }),
        )
      ],
    );
  }
}
