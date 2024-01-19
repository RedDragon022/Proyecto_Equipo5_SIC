import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teachersguard/presentation/widgets/shared/buttons/custom_rectangle_button.dart';

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

    final titleStyle = textStyle.displaySmall?.copyWith(
        fontWeight: FontWeight.w600);

    final labelStyle = textStyle.titleMedium?.copyWith(
        fontWeight: FontWeight.w500);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text('Configuración', style: titleStyle),
          const SizedBox(height: 10),
          Text('Cambiar tema de la aplicación', style: labelStyle),
          const SizedBox(height: 15),
          const _SliderTheme(),
          const SizedBox(height: 15),
          CustomRectangleButton(
            text: 'Cambiar contraseña',
            backgroundColor: Colors.grey,
          ),
          const SizedBox(height: 15),
          CustomRectangleButton(text: 'Cerrar sesión'),
        ],
      ),
    );
  }
}

class _SliderTheme extends StatefulWidget {
  const _SliderTheme();

  @override
  State<_SliderTheme> createState() => _SliderThemeState();
}

class _SliderThemeState extends State<_SliderTheme> {
  bool _newValue = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.sunny),
        CupertinoSwitch(
            value: _newValue,
            activeColor: color,
            onChanged: (value) => setState(() {
                  _newValue = value;
                })),
        const Icon(Icons.nights_stay_rounded),
      ],
    );
  }
}
