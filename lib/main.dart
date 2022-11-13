import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './views/color-schemes/dark_scheme.dart';
import './views/color-schemes/light_scheme.dart';

import './views/components/auth/signin_screen.dart';
import './views/components/auth/signup_screen.dart';
import './views/components/home/home_screen.dart';

bool isDark = true;
bool isLoggedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
      providers: [
        Provider<MainDarkTheme>(
          create: (context) => MainDarkTheme(),
        ),
        Provider<MainLightTheme>(
          create: (context) => MainLightTheme(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const TuneLikeApp(),
            'home': (context) => const HomeScreen(),
            'signup': (context) => const SignUpScreen(),
            'signin': (context) => const SignInScreen(),
          })));
}

class TuneLikeApp extends StatelessWidget {
  const TuneLikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = isDark
        ? Provider.of<MainDarkTheme>(context).mainDarkTheme
        : Provider.of<MainLightTheme>(context).mainLightTheme;
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: currentTheme,
              home: Scaffold(
                appBar: AppBar(title: const Text('Connection error')),
                body: const Center(child: Text('error')),
              ));
        }

        // Once complete, launch application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: currentTheme,
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('TuneLike'),
                  centerTitle: true,
                ),
                body: isLoggedIn
                    ? SafeArea(
                        child: ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('home'),
                        child: const Text('Go to next screen'),
                      ))
                    : const SafeArea(child: SignInScreen()),
              ));
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: currentTheme,
            home: Scaffold(
              appBar: AppBar(title: const Text('Loading')),
              body: const Center(child: Text('please wait')),
            ));
      },
    );
  }
}

// bool isDark = true;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(MultiProvider(providers: [
//     Provider<MainDarkTheme>(
//       create: (context) => MainDarkTheme(),
//     ),
//   ], child: const TuneLikeApp()));
// }

// class TuneLikeApp extends StatelessWidget {
//   const TuneLikeApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire
//       future: Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform),
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return MaterialApp(
//               home: Scaffold(
//             appBar: AppBar(title: const Text('Connection error')),
//             body: const Center(child: Text('error')),
//           ));
//         }

//         // Once complete, launch application
//         if (snapshot.connectionState == ConnectionState.done) {
//           final ThemeData currentTheme = isDark
//               ? Provider.of<MainDarkTheme>(context).mainDarkTheme
//               : Provider.of<MainDarkTheme>(context).mainDarkTheme;
//           return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               theme: currentTheme,
//               initialRoute: '/',
//               routes: {
//                 '/': (context) => const HomeScreen(),
//                 'signup': (context) => const SignUpScreen(),
//                 'signin': (context) => const SignInScreen(),
//               });
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return MaterialApp(
//             home: Scaffold(
//           appBar: AppBar(title: const Text('Loading')),
//           body: const Center(child: Text('please wait')),
//         ));
//       },
//     );
//   }
// }


