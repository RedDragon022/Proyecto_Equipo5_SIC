import 'package:flutter/material.dart';

import '../../../config/constants/assets_conts.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key, this.titleTextStyle, this.contentTextStyle});

  final TextStyle? titleTextStyle;
  final TextStyle? contentTextStyle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      titleTextStyle: titleTextStyle,
      title: const Text('Cargar foto para reconocimiento facial',
          textAlign: TextAlign.center),
      content: const _ContentInfo(),
      contentTextStyle: contentTextStyle,
      actions: [
        TextButton.icon(
            label: const Text('Subir foto'),
            onPressed: () {},
            icon: const Icon(Icons.upload)),
        TextButton.icon(
            label: const Text('Tomar foto'),
            onPressed: () {},
            icon: const Icon(Icons.photo_camera))
      ],
    );
  }
}

class _ContentInfo extends StatelessWidget {
  const _ContentInfo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          const Text(
              'La foto tiene que ser de tu rostro y que sea lo mas clara posible, de la siguiente manera.'),
          const SizedBox(height: 15),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(AssetsConsts.recognitionImage,
                  width: 100, height: 100)),
        ],
      ),
    );
  }
}
