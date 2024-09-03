import 'package:go_router/go_router.dart';

import '../Views/AuthPage/landing_page.dart';
import '../Views/AuthPage/login_screen.dart';
import '../Views/AuthPage/register_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
