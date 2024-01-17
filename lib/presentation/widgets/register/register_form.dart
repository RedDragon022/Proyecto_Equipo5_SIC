import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teachersguard/presentation/providers/forms/register_form_provider.dart';

import '../widgets.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  void showSnackBar(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;

    final textFont = GoogleFonts.poppins();

    final textTitleStyle = textFont.copyWith(
      fontSize: textStyle.titleLarge?.fontSize,
      fontWeight: FontWeight.w600,
    );

    final textSubtitleStyle =
        textFont.copyWith(fontSize: textStyle.labelLarge?.fontSize);

    final registerForm = ref.watch(registerFormProvider);

    final registerNotifier = ref.watch(registerFormProvider.notifier);

    if (registerForm.image.value.isNotEmpty && context.canPop()) context.pop();

    ref.listen(registerFormProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackBar(context, next.errorMessage);
    });

    ref.listen(registerFormProvider, (previous, next) {
      if (next.isRegistered) context.go('/');
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Registro', style: textTitleStyle),
          const SizedBox(height: 20),
          CustomAvatarButton(
            radius: 40,
            image: registerForm.image.value,
            onTap: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => CustomAlertDialog(
                      contentTextStyle: textSubtitleStyle,
                      titleTextStyle: textTitleStyle,
                    )),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Correo o num de empleado',
            onChanged: registerNotifier.onEmailOrEmployeeNumberChange,
            errorText: registerForm.isFormPosted
                ? registerForm.emailOrEmployeeNumber.errorMessage
                : null,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Nombre',
            onChanged: registerNotifier.onNameChange,
            errorText: registerForm.isFormPosted
                ? registerForm.name.errorMessage
                : null,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Apellidos',
            onChanged: registerNotifier.onSurnamesChange,
            errorText: registerForm.isFormPosted
                ? registerForm.surnames.errorMessage
                : null,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Contraseña',
            obscureText: true,
            onChanged: registerNotifier.onPasswordChange,
            errorText: registerForm.isFormPosted
                ? registerForm.password.errorMessage
                : null,
          ),
          const SizedBox(height: 20),
          CustomRectangleButton(
              text: 'Registrarse',
              onPressed: () => {
                    if (registerForm.image.value.isEmpty)
                      {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => CustomAlertDialog(
                                  contentTextStyle: textSubtitleStyle,
                                  titleTextStyle: textTitleStyle,
                                ))
                      },
                    registerNotifier.onFormSubmit()
                  }),
          const SizedBox(height: 20),
          _CreateAccountRow(
              textStyle:
                  textSubtitleStyle.copyWith(fontWeight: FontWeight.w400))
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
        Text('Ya tienes cuenta?', style: textStyle),
        const SizedBox(width: 8),
        CustomTextButton(
            text: 'Iniciar sesión', onPressed: () => context.go('/'))
      ],
    );
  }
}
