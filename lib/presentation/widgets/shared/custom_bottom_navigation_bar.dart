import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: 0,
      backgroundColor: Colors.transparent,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Agenda'),
        BottomNavigationBarItem(icon: Icon(Icons.school_outlined), label: 'Estadísticas'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configuración'),
      ],
    );
  }
}