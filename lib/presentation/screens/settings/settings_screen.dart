import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final textFont = GoogleFonts.poppins();

    final titleStyle = textFont.copyWith(
        fontSize: textStyle.displaySmall?.fontSize,
        fontWeight: FontWeight.w600);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text('Configuración', style: titleStyle)
        ],
      ),
    );
  }
}
