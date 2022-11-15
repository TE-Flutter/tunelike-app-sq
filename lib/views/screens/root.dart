import '../../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../color-schemes/dark_scheme.dart';
import '../color-schemes/light_scheme.dart';

import 'package:course_example_app/internal/route_generator.dart';
import 'package:course_example_app/views/screens/auth/signin_screen.dart';
import 'package:course_example_app/views/screens/home/home_screen.dart';

bool isDark = true;
bool isLoggedIn = false;

class TuneLikeApp extends StatelessWidget {
  const TuneLikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = isDark
        ? Provider.of<MainDarkTheme>(context).mainDarkTheme
        : Provider.of<MainLightTheme>(context).mainLightTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(
                    title: const Text('Connection error'), centerTitle: true),
                body: Center(child: Text(snapshot.error.toString())),
              );
            }

            // Once complete, launch application
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('TuneLike'),
                    centerTitle: true,
                  ),
                  body: isLoggedIn ? const HomeScreen() : const SignInScreen());
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return Scaffold(
              appBar: AppBar(title: const Text('Loading'), centerTitle: true),
              body: const Center(child: Text('please wait')),
            );
          }),
    );
  }
}
