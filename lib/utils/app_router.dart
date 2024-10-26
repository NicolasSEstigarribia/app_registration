import 'package:app_registration/view/pages/auth/create_account_screen.dart';
import 'package:app_registration/view/pages/auth/sign_in_screen.dart';
import 'package:app_registration/view/pages/home/home_screen.dart';
import 'package:app_registration/view/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static const String splashScreen = '/';
  static const String homeScreen = '/homeScreen';
  static const String signInScreen = '/signInScreen';
  static const String createAccountScreen = '/createAccountScreen';

  static final Map<String, Widget Function(BuildContext, Object?)> _routes = {
    splashScreen: (_, __) => const SplashScreen(),
    homeScreen: (_, __) => const HomeScreen(),
    signInScreen: (_, __) => const SignInScreen(),
    createAccountScreen: (_, __) => const CreateAccountScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = _routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(
        builder: (context) => builder(context, settings.arguments),
        settings: settings,
      );
    }

    // Maneja rutas desconocidas o rutas que no están definidas en _routes
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No existe la ruta: ${settings.name}'),
        ),
      ),
    );
  }
}
