import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

    int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/home':
        return 0;
      case '/schedule':
        return 1;
      case '/stadistics':
        return 2;
      case '/config':
        return 3;
      default:
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/schedule');
        break;
      case 2:
        context.go('/stadistics');
        break;
      case 3:
        context.go('/settings');
        break;
      default:
        context.go('/');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: getCurrentIndex(context),
      onTap: (index) => onItemTapped(context, index),
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