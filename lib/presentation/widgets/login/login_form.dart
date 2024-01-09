import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachersguard/presentation/providers/forms/login_form_provider.dart';

import '../widgets.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;

    final loginForm = ref.watch(loginFormProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Iniciar sesión',
              style: GoogleFonts.poppins(
                fontSize: textStyle.titleLarge?.fontSize,
                fontWeight: FontWeight.w600, // O FontWeight.bold para negrita
              )),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: 'Correo o num de empleado',
            onChanged: ref
                .read(loginFormProvider.notifier)
                .onEmailOrEmployeeNumberChange,
            errorText: loginForm.isFormPosted
                ? loginForm.emailOrEmployeeNumber.errorMessage
                : null,
          ),
          const SizedBox(height: 30),
          CustomTextField(
            labelText: 'Contraseña',
            obscureText: true,
            onChanged: ref.read(loginFormProvider.notifier).onPasswordChange,
            errorText:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
          ),
          const SizedBox(height: 20),
          CustomTextButton(
              text: 'Restablecer contraseña', onPressed: () => null),
          const SizedBox(height: 20),
          CustomRectangleButton(
            text: 'Ingresar',
            onPressed: loginForm.isPosting
                ? null
                : ref.read(loginFormProvider.notifier).onFormSubmit,
          ),
          const SizedBox(height: 40),
          _CreateAccountRow(textStyle: textStyle)
        ],
      ),
    );
  }
}

class _CreateAccountRow extends ConsumerWidget {
  const _CreateAccountRow({
    required this.textStyle,
  });

  final TextTheme textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No tienes cuenta?',
            style: GoogleFonts.poppins(
              fontSize: textStyle.labelLarge?.fontSize,
              fontWeight: FontWeight.w400, // O FontWeight.bold para negrita
            )),
        const SizedBox(width: 8),
        CustomTextButton(
            text: 'Registrarse',
            onPressed: () => {
                  context.go('/register')
                })
      ],
    );
  }
}
