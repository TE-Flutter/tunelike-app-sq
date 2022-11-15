import 'package:flutter/material.dart';

const Color customPrimaryCoal = Color(0xFF242424);
const Color customWhitePearl = Color(0xFFFBFCF8);
const Color customWhitePowder = Color(0xFFFBFCFA);

const Color customErrorRed = Color(0xFFFE1B3F);

const Color customSurfaceCoal = Color(0xFF111111);
const Color customBackgroundCoal = Color(0xFF1c1c1c);

class MainDarkTheme {
  final mainDarkTheme = ThemeData(
    colorScheme: _customColorScheme,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 22,
        color: customWhitePearl,
      ),
      bodyText2: TextStyle(
        color: customWhitePowder,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        backgroundColor: customBackgroundCoal,
      ),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: customWhitePowder,
        backgroundColor: customPrimaryCoal,
      ),
      headline1: TextStyle(
        color: customWhitePowder,
        fontSize: 60,
        fontFamily: 'Allison',
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: customWhitePowder,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: customBackgroundCoal,
    appBarTheme: const AppBarTheme(
      backgroundColor: customSurfaceCoal,
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.white),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: customWhitePowder),
      centerTitle: false,
      elevation: 15,
      titleTextStyle: TextStyle(
        color: customWhitePowder,
        fontWeight: FontWeight.bold,
        fontFamily: 'PermanentMarker',
        fontSize: 40,
      ),
    ),
  );
}

const ColorScheme _customColorScheme = ColorScheme(
  primary: customPrimaryCoal,
  // ignore: deprecated_member_use
  primaryVariant: customWhitePowder,
  secondary: Colors.amber,
  // ignore: deprecated_member_use
  secondaryVariant: customWhitePowder,
  surface: Colors.purpleAccent,
  background: customSurfaceCoal,
  error: customWhitePowder,
  onPrimary: Colors.white,
  onSecondary: customSurfaceCoal,
  onSurface: customWhitePearl,
  onBackground: customWhitePowder,
  onError: customErrorRed,
  brightness: Brightness.dark,
);
