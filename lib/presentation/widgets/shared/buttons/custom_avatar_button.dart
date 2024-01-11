import 'package:flutter/material.dart';

import '../../../../config/constants/assets_conts.dart';

class CustomAvatarButton extends StatelessWidget {
  const CustomAvatarButton({super.key, this.radius, this.onTap});

  final double? radius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(AssetsConsts.defaultAvatar)
          ),
    );
  }
}
