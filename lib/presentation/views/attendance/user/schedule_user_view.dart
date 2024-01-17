import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachersguard/config/helpers/day_helper.dart';

import 'package:teachersguard/presentation/providers/providers.dart';
import '../../../widgets/widgets.dart';

class ScheduleUserView extends ConsumerWidget {
  const ScheduleUserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(scheduleProvider.notifier).getScheduleByUserId();

    final schedules = ref.watch(scheduleProvider);

    final deviceHeight = MediaQuery.of(context).size.height;

    final textStyle = Theme.of(context).textTheme;

    final font = GoogleFonts.poppins();

    final style = font.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: textStyle.titleMedium?.fontSize,
        letterSpacing: 1.5);

    return Column(
      children: [
        const Icon(Icons.calendar_month_sharp),
        CustomSchedule(onDaySelected: (selectedDay, focusedDay) {
          final currentDay =
              DayHelper.convertDartDayToBackendDay(selectedDay.weekday);

          final currentSchedule = schedules
              .where(
                (schedule) => schedule.dayOfWeek.contains(currentDay),
              )
              .toList();

          showCupertinoModalPopup(
              context: context,
              builder: (context) => SizedBox(
                  height: deviceHeight / 2,
                  child: CupertinoPopupSurface(
                    child: currentSchedule.isEmpty
                        ? Center(
                            child: TextButton.icon(
                            icon: const Icon(Icons.calendar_month_sharp),
                            onPressed: () => context.pop(),
                            label: Text(
                                'No hay alguna clase asignada para el dia actual',
                                style: style),
                          ))
                        : CustomScheduleList(
                            schedules: currentSchedule,
                            titleStyle: style,
                            subtitleStyle: style,
                            containerTextStyle: style,
                          ),
                  )));
        }),
      ],
    );
  }
}
