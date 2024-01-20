import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:teachersguard/config/theme/app_theme_provider.dart';
import 'package:teachersguard/presentation/providers/providers.dart';

import '../../widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _SettingsView(),
    );
  }
}

class _SettingsView extends ConsumerWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;

    final titleStyle =
        textStyle.displaySmall?.copyWith(fontWeight: FontWeight.w600);

    final labelStyle =
        textStyle.titleMedium?.copyWith(fontWeight: FontWeight.w500);

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
          const CustomRectangleButton(
            text: 'Cambiar contraseña',
            backgroundColor: Color(0xFFF2F1F1),
            textColor: Colors.black,
          ),
          const SizedBox(height: 30),
          CustomRectangleButton(
            text: 'Cerrar sesión',
            backgroundColor: const Color(0xFFF2F1F1),
            textColor: Colors.red,
            onPressed: () => {
              ref.read(userProvider.notifier).removeLocalUserAuth(),
              context.go('/')},
          ),
        ],
      ),
    );
  }
}

class _SliderTheme extends ConsumerStatefulWidget {
  const _SliderTheme();

  @override
  ConsumerState<_SliderTheme> createState() => _SliderThemeState();
}

class _SliderThemeState extends ConsumerState<_SliderTheme> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    final theme = ref.watch(themeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.sunny),
        CupertinoSwitch(
            value: theme.isDarkMode,
            activeColor: color,
            onChanged: ref.read(themeProvider.notifier).onThemeChange),
        const Icon(Icons.nights_stay_rounded),
      ],
    );
  }
}
