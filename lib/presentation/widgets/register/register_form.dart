import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Registro',
              style: GoogleFonts.poppins(
                fontSize: textStyle.titleLarge?.fontSize,
                fontWeight: FontWeight.w600, // O FontWeight.bold para negrita
              )),
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
          _CreateAccountRow(textStyle: textStyle)
        ],
      ),
    );
  }
}

class _CreateAccountRow extends StatelessWidget {
  const _CreateAccountRow({
    required this.textStyle,
  });

  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Text('Ya tienes cuenta?',
            style: GoogleFonts.poppins(
              fontSize: textStyle.labelLarge?.fontSize,
              fontWeight:
                  FontWeight.w400, // O FontWeight.bold para negrita
            )),
        const SizedBox(width: 8),
        CustomTextButton(text: 'Iniciar sesión', onPressed: () => context.go('/login'))
      ],
    );
  }
}
