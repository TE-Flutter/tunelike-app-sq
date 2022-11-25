import './views/screens/root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './views/color-schemes/dark_scheme.dart';
import './views/color-schemes/light_scheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<MainDarkTheme>(
          create: (context) => MainDarkTheme(),
        ),
        Provider<MainLightTheme>(
          create: (context) => MainLightTheme(),
        ),
      ],
      child: const TuneLikeApp(),
    ),
  );
}
