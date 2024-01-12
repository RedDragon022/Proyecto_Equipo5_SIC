import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../config/constants/assets_conts.dart';

class CustomAvatarButton extends StatelessWidget {
  const CustomAvatarButton({super.key, this.radius, this.onTap, this.image});

  final double? radius;
  final void Function()? onTap;
  final String? image;

  ImageProvider<Object> getImageProvider(String? image) {
    if (image != null && image.isNotEmpty) {
      
      if (image.startsWith('blob')) {
        return NetworkImage(image);
      }

      return FileImage(File(image));

    } else {
      return AssetImage(AssetsConsts.defaultAvatar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          CircleAvatar(
              radius: radius, backgroundImage: getImageProvider(image)),
          const Positioned(top: 50, left: 50, child: Icon(Icons.add_a_photo)),
        ],
      ),
    );
  }
}
