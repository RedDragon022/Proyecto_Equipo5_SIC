import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/helpers/date_helper.dart';
import 'package:teachersguard/presentation/providers/providers.dart';
import 'package:teachersguard/presentation/widgets/widgets.dart';

import '../../../config/helpers/day_helper.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);



    final schedules = ref.watch(scheduleProvider);

    final currentTime = DateTime.now();

    final currentDay =
        DayHelper.convertDartDayToBackendDay(currentTime.weekday);
  final currentShedules = schedules
    .takeWhile((schedule) =>
        schedule.dayOfWeek.contains(currentDay) || schedule.dayOfWeek.contains(currentDay + 1))
    .toList();

    // Obtener los primeros dos elementos de la lista ordenada
    currentShedules.take(2).toList();

    return Column(
      children: [
        HeaderHome(
          name: user.name,
          imageUrl: user.imageProfile,
        ),
        Flexible(
          child: ListView.separated(
              itemCount: currentShedules.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              separatorBuilder: (context, index) => const SizedBox(height: 30),
              itemBuilder: (context, index) {
                final currentSchedule = currentShedules[index];

                final entryHour = DateHelper.convertTo12HourFormatBackend(
                    currentSchedule.begin);

                final exitHour = DateHelper.convertTo12HourFormatBackend(
                    currentSchedule.end);

                return ClassBox(
                  classLabel: (index == 0) ? 'Clase Actual' : 'Siguiente clase',
                  classRoomLabel: currentSchedule.place.name,
                  hourLabel: '$entryHour-$exitHour',
                );
              }),
        )
      ],
    );
  }
}
