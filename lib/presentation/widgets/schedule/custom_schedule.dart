import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomSchedule extends StatelessWidget {
  const CustomSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();

    final textStyleContext = Theme.of(context).textTheme;

    const selectedDayDecoration = BoxDecoration(
      color: Color(0xFF03F0FF),
      shape: BoxShape.circle,
    );

    const selectedDayTextStyle = TextStyle(color: Colors.black);

    const calendarStyle = CalendarStyle(
      todayDecoration: selectedDayDecoration,
      todayTextStyle: selectedDayTextStyle,
    );

    final headerStyle = HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false, // Oculta el botón de cambio de formato predeterminado
        titleTextStyle: textStyleContext.titleLarge!.copyWith(
            color: const Color(0xFF7B7B7B), fontWeight: FontWeight.w600));

    final weekStyle = textStyleContext.labelLarge!.copyWith(
            color: const Color(0xFF7B7B7B), fontWeight: FontWeight.w600);

    final daysOfWeekStyle = DaysOfWeekStyle(
      weekdayStyle: weekStyle,
      weekendStyle: weekStyle
    );

    return TableCalendar(
      firstDay: currentTime,
      lastDay: currentTime.add(const Duration(days: 6 * 30)),
      focusedDay: currentTime,
      calendarStyle: calendarStyle,
      headerStyle: headerStyle,
      daysOfWeekStyle: daysOfWeekStyle,
    );
  }
}
