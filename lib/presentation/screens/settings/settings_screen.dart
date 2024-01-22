import 'package:flutter/material.dart';

import '../../views/views.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsView(),
    );
  }
}

