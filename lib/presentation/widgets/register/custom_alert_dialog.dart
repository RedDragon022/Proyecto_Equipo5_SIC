import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teachersguard/presentation/providers/providers.dart';

import '../../../config/constants/assets_conts.dart';

class CustomAlertDialog extends ConsumerWidget {
  const CustomAlertDialog(
      {super.key, this.titleTextStyle, this.contentTextStyle});

  final TextStyle? titleTextStyle;
  final TextStyle? contentTextStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog.adaptive(
      titleTextStyle: titleTextStyle,
      title: const Text('Cargar foto para reconocimiento facial',
          textAlign: TextAlign.center),
      content: const _ContentInfo(),
      contentTextStyle: contentTextStyle,
      actions: [
        TextButton.icon(
            label: const Text('Subir foto'),
            onPressed: ref.read(registerFormProvider.notifier).onSelectPhoto,
            icon: const Icon(Icons.upload)),
        TextButton.icon(
            label: const Text('Tomar foto'),
            onPressed: ref.read(registerFormProvider.notifier).onTakePhoto,
            icon: const Icon(Icons.photo_camera))
      ],
    );
  }
}

class _ContentInfo extends StatelessWidget {
  const _ContentInfo();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: deviceHeight / 2.5,
      child: Column(
        children: [
          const Text(
              'La foto tiene que ser de tu rostro y que sea lo mas clara posible, de la siguiente manera. '
              "Si subes una foto que no sea como la de la imagen tendrás problemas al registrar asistencia."),
          const SizedBox(height: 10),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(AssetsConsts.recognitionImage,
                  width: 90, height: 90)),
        ],
      ),
    );
  }
}
