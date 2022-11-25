//https://github.com/djshah17/Flutter-Navigation-Routing-Sample

import 'package:flutter/material.dart';
import 'package:tunelike/views/screens/auth/signin_screen.dart';
import 'package:tunelike/views/screens/auth/signin_screen_forgot_password.dart';
import 'package:tunelike/views/screens/auth/signup_screen.dart';
import 'package:tunelike/views/screens/auth/signup_screen_phone_input.dart';
import 'package:tunelike/views/screens/auth/signup_screen_phone_verification.dart';
import 'package:tunelike/views/screens/auth/signup_screen_preferences.dart';

import 'package:tunelike/views/screens/home/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      /* #region Auth */
      case '/SignUpScreen':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case '/SignUpScreen/PhoneInput':
        return MaterialPageRoute(
            builder: (_) => SignUpScreen_PhoneInput(user: args));
      case '/SignUpScreen/PhoneVerification':
        return MaterialPageRoute(
          builder: (_) => SignUpScreen_PhoneVerification(
            phoneNumber: args[0],
            user: args[1],
          ),
        );
      case '/SignUpScreen/Preferences':
        return MaterialPageRoute(
            builder: (_) => SignUpScreen_Preferences(user: args));
      case '/SignInScreen':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case '/SignInScreen/ForgotPassword':
        return MaterialPageRoute(
            builder: (_) => const SignInScreen_ForgotPassword());
      /* #region Auth */
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

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;
//     switch (settings.name) {
//       /* #region Auth */
//       case '/SignUpScreen':
//         return MaterialPageRoute(builder: (_) => const SignUpScreen());
//       case '/SignUpScreen/PhoneInput':
//         return MaterialPageRoute(
//             builder: (_) => const SignUpScreen_PhoneInput());
//       case '/SignUpScreen/PhoneVerification':
//         if (args is String) {
//           return MaterialPageRoute(
//             builder: (_) => SignUpScreen_PhoneVerification(
//               phoneNumber: args, 
//             ),
//           );
//         }
//         return _errorRoute();
//       case '/SignUpScreen/Preferences':
//         return MaterialPageRoute(
//             builder: (_) => const SignUpScreen_Preferences());
//       case '/SignInScreen':
//         return MaterialPageRoute(builder: (_) => const SignInScreen());
//       case '/SignInScreen/ForgotPassword':
//         return MaterialPageRoute(
//             builder: (_) => const SignInScreen_ForgotPassword());
//       /* #region Auth */
//       case '/HomeScreen':
//         return MaterialPageRoute(builder: (_) => const HomeScreen());
//       default:
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Error'),
//         ),
//         body: const Center(
//           child: Text('ERROR'),
//         ),
//       );
//     });
//   }
// }
