import 'package:go_router/go_router.dart';
import 'package:teachersguard/presentation/screens/screens.dart';

import '../../presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen()
    ),

    GoRoute(
      path: '/register',
      name: RegisterScreen.name,
      builder: (context, state) => const RegisterScreen(),
    ),

    ShellRoute(
      builder: (context, state, child) => HomeScreen(childView: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: '/schedule',
          builder: (context, state) => const ScheduleScreen(),
        )
      ]
    )
    
  ]

  
);
