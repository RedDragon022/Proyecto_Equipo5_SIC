import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachersguard/presentation/views/schedule/user/user_schedule_view.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _ScheduleView(),
    );
  }
}

class _ScheduleView extends StatelessWidget {
  const _ScheduleView();

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;
    final textFont = GoogleFonts.poppins();

    final titleStyle = textFont.copyWith(
          fontSize: textStyle.displaySmall?.fontSize,
          fontWeight: FontWeight.w600
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text('Agenda', style: titleStyle),
          const SizedBox(height: 20),
          UserScheduleView()
        ],
      ),
    );
  }
}
