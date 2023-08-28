import 'package:base_flutter_bloc_pattem/feature/auth/login/presentation/pages/login.dart';
import 'package:base_flutter_bloc_pattem/feature/auth/splash/presentation/splash.dart';
import 'package:flutter/material.dart';

class Routing {
  static const String splash = "/";
  static const String login = "/login";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return fadeThrough(settings, (context) {
      switch (settings.name) {
        case Routing.splash:
          return const SplashView();
        case Routing.login:
          return const LoginView();
        default:
          return const SplashView();
      }
    });
  }

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 200}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child
        );
      },
    );
  }
}
