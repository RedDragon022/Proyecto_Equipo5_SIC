import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassBox extends StatelessWidget {
  const ClassBox({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    final textStyle = Theme.of(context).textTheme;
    final textFont = GoogleFonts.poppins();

    final titleStyle = textFont.copyWith(
        fontSize: textStyle.titleLarge?.fontSize, fontWeight: FontWeight.w600);
    final subtitleStyle = textFont.copyWith(
      fontSize: textStyle.titleMedium?.fontSize,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: deviceHeight / 3,
        color: const Color.fromARGB(255, 218, 218, 218),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Clase actual', style: titleStyle),
            const SizedBox(height: 5),
            Text(
              'Salón 401',
              style: subtitleStyle,
            ),
            const SizedBox(height: 5),
            Text(
              '10:00 A.M - 11:00 P.M',
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
                Flexible(child: _AnimatedProgressIndicator()),
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
        Icon(icon, color: iconColor,)],
    );
  }
}

class _AnimatedProgressIndicator extends StatefulWidget {
  @override
  _AnimatedProgressIndicatorState createState() =>
      _AnimatedProgressIndicatorState();
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

    _animation = Tween<double>(begin: 0, end: 0.5).animate(_controller);

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
