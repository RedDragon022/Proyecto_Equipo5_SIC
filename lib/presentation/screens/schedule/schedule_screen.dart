import 'package:flutter/material.dart';

import 'package:teachersguard/presentation/views/views.dart';


class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScheduleView()
    );
  }
}

