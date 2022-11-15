//https://github.com/djshah17/Flutter-Navigation-Routing-Sample

import 'package:flutter/material.dart';
import 'package:course_example_app/views/screens/auth/signin_screen.dart';
import 'package:course_example_app/views/screens/auth/signup_screen.dart';
import 'package:course_example_app/views/screens/home/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/SignUpScreen':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case '/SignInScreen':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case '/HomeScreen':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
