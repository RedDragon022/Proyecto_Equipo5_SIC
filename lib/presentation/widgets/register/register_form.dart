import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final textFont = GoogleFonts.poppins();

    final textTitleStyle = textFont.copyWith(
      fontSize: textStyle.titleLarge?.fontSize,
      fontWeight: FontWeight.w600,
    );

    final textSubtitleStyle = textFont.copyWith(fontSize: textStyle.labelLarge?.fontSize);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Registro', style: textTitleStyle),
          const SizedBox(height: 20),
          CustomAvatarButton(
            radius: 40,
            onTap: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => CustomAlertDialog(
                  contentTextStyle: textSubtitleStyle,
                  titleTextStyle: textTitleStyle,
                )),
          ),
          const SizedBox(height: 20),
          const CustomTextField(labelText: 'Correo o num de empleado'),
          const SizedBox(height: 20),
          const CustomTextField(labelText: 'Nombre'),
          const SizedBox(height: 20),
          const CustomTextField(labelText: 'Apellidos'),
          const SizedBox(height: 20),
          const CustomTextField(labelText: 'Contraseña', obscureText: true),
          const SizedBox(height: 20),
          CustomRectangleButton(text: 'Registrarse', onPressed: () => null),
          const SizedBox(height: 20),
          _CreateAccountRow(textStyle: textSubtitleStyle.copyWith(fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}



class _CreateAccountRow extends StatelessWidget {
  const _CreateAccountRow({
    this.textStyle,
  });

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Ya tienes cuenta?',
            style: textStyle),
        const SizedBox(width: 8),
        CustomTextButton(
            text: 'Iniciar sesión', onPressed: () => context.go('/'))
      ],
    );
  }
}
