import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:teachersguard/config/constants/assets_conts.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key, required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final textStyle = Theme.of(context).textTheme;

    return Container(
      height: deviceHeight / 8,
      color: Colors.grey.shade500,
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      alignment: Alignment.bottomCenter,
      child: _WelcomeText(
          textStyle: (deviceWidth < 300)
              ? textStyle.titleMedium
              : textStyle.titleLarge,
          name: name,
          imageUrl: imageUrl,
          avatarRadius: (deviceWidth < 300) ? 25 : 30),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText(
      {required this.textStyle,
      required this.name,
      required this.imageUrl,
      required this.avatarRadius});

  final TextStyle? textStyle;
  final String name;
  final String imageUrl;
  final double avatarRadius;

  ImageProvider<Object> _getBackgroundImage(String imageUrl) {
    final ImageProvider backgroundImage;

    imageUrl.isEmpty
        ? backgroundImage = AssetImage(AssetsConsts.defaultAvatar)
        : backgroundImage = MemoryImage(base64Decode(imageUrl));

    return backgroundImage;
  }

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(radius: avatarRadius, backgroundImage: _getBackgroundImage(imageUrl)),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                  text: 'Hola, ',
                  style: textStyle?.copyWith(
                      fontSize: textStyle?.fontSize,
                      fontStyle: textStyle?.fontStyle)),
              TextSpan(
                  text: "$name!",
                  style: textStyle?.copyWith(
                      fontSize: textStyle?.fontSize,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
