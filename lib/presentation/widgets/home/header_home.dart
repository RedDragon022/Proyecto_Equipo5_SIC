import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      color: const Color.fromARGB(255, 218, 218, 218),
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

  @override
  Widget build(BuildContext context) {
    
    final textFont = GoogleFonts.poppins();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(radius: avatarRadius, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                  text: 'Hola, ',
                  style: textFont.copyWith(fontSize: textStyle?.fontSize)),
              TextSpan(
                  text: "$name!",
                  style: textFont.copyWith(
                      fontSize: textStyle?.fontSize,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
