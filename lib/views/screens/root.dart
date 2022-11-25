import 'package:firebase_auth/firebase_auth.dart';

import '../../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../color-schemes/dark_scheme.dart';
import '../color-schemes/light_scheme.dart';

import 'package:tunelike/internal/route_generator.dart';
import 'package:tunelike/views/screens/home/home_screen.dart';

import 'package:tunelike/internal/auth/auth_provider.dart';
import 'package:tunelike/internal/auth/auth_service.dart';

import 'auth/signin_screen.dart';

bool isDark = true;
// bool isLoggedIn = false;

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
            return AuthProvider(
                auth: AuthService(),
                child: Scaffold(
                  body: StreamBuilder(
                    stream: FirebaseAuth.instance.userChanges(),
                    builder: (context, snapshot) {
                      final user = snapshot.data;
                      if (user == null) {
                        //print('im here (user is null)');
                        return const SignInScreen();
                      } else {
                        //print('im here (in the app) $user');
                        return const HomeScreen();
                      }
                    },
                  ),
                ));
          }

          // Otherwise, show that its loading
          return Scaffold(
            appBar: AppBar(title: const Text('Loading'), centerTitle: true),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
