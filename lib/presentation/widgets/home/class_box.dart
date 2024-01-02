import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassBox extends StatelessWidget {
  const ClassBox({super.key,
  required this.classLabel,
  required this.classRoomLabel,
  required this.hourLabel});

  final String classLabel;
  final String classRoomLabel;
  final String hourLabel;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final textStyle = Theme.of(context).textTheme;
    final textFont = GoogleFonts.poppins();

    final titleStyle = textFont.copyWith(
        fontSize: (deviceWidth < 300 ) ? textStyle.titleMedium?.fontSize
        : textStyle.titleLarge?.fontSize, fontWeight: FontWeight.w600);

    final subtitleStyle = textFont.copyWith(
      fontSize:(deviceWidth < 300 ) ?  textStyle.titleSmall?.fontSize
      : textStyle.titleMedium?.fontSize,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height:  (deviceWidth < 300 ) ? deviceHeight / 2.8 : deviceHeight / 3,
        color: const Color.fromARGB(255, 218, 218, 218),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(classLabel, style: titleStyle),
            const SizedBox(height: 5),
            Text(
              classRoomLabel,
              style: subtitleStyle,
            ),
            const SizedBox(height: 5),
            Text(
             hourLabel,
              style: subtitleStyle,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _TextProgressIndicator(
                    label: 'Entrada',
                    icon: Icons.check_circle,
                    iconColor: Colors.green.shade400,
                    textStyle: subtitleStyle),
                const SizedBox(width: 10),
                Flexible(child: _AnimatedProgressIndicator(isCompleted: true)),
                const SizedBox(width: 10),
                _TextProgressIndicator(
                    label: 'Salida',
                    icon: CupertinoIcons.xmark_circle_fill,
                    iconColor: Colors.red,
                    textStyle: subtitleStyle),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TextProgressIndicator extends StatelessWidget {
  const _TextProgressIndicator({
    required this.textStyle,
    required this.label,
    required this.icon,
    this.iconColor,
  });

  final TextStyle textStyle;
  final String label;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: textStyle),
        const SizedBox(height: 5),
        Icon(
          icon,
          color: iconColor,
        )
      ],
    );
  }
}

class _AnimatedProgressIndicator extends StatefulWidget {
  const _AnimatedProgressIndicator({required this.isCompleted});

  @override
  _AnimatedProgressIndicatorState createState() =>
      _AnimatedProgressIndicatorState();

  final bool isCompleted;
}

class _AnimatedProgressIndicatorState extends State<_AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Duración de la animación
    );

    // Ajustar el rango de la animación según el valor
    if (widget.isCompleted) {
      _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    } else {
      _animation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
    }

    _controller.forward(); // Iniciar la animación
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animation.value,
          color: const Color(0xFF14C846),
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(20),
          minHeight: 15,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
