import 'package:flutter/material.dart';

const Color customPrimaryCoal = Color(0xFF242424);
const Color customWhitePearl = Color(0xFFFBFCF8);
const Color customWhitePowder = Color(0xFFFBFCFA);

const Color customErrorRed = Color(0xFFFE1B3F);

const Color customSurfaceCoal = Color(0xFF111111);
const Color customBackgroundCoal = Color(0xFF1c1c1c);

class MainLightTheme {
  final mainLightTheme = ThemeData(
    colorScheme: _customColorScheme,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 22,
        color: customSurfaceCoal,
      ),
      bodyText2: TextStyle(
        color: customSurfaceCoal,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        backgroundColor: customWhitePearl,
      ),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: customSurfaceCoal,
        backgroundColor: customWhitePearl,
      ),
      headline1: TextStyle(
        color: customSurfaceCoal,
        fontSize: 60,
        fontFamily: 'Allison',
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: customSurfaceCoal,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: customWhitePearl,
    appBarTheme: const AppBarTheme(
      backgroundColor: customWhitePearl,
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.white),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: customSurfaceCoal),
      centerTitle: false,
      elevation: 15,
      titleTextStyle: TextStyle(
        color: customSurfaceCoal,
        fontWeight: FontWeight.bold,
        fontFamily: 'PermanentMarker',
        fontSize: 40,
      ),
    ),
  );
}

const ColorScheme _customColorScheme = ColorScheme(
  primary: customWhitePowder,
  // ignore: deprecated_member_use
  primaryVariant: customSurfaceCoal,
  secondary: Colors.amber,
  // ignore: deprecated_member_use
  secondaryVariant: customSurfaceCoal,
  surface: Colors.purpleAccent,
  background: customWhitePowder,
  error: customSurfaceCoal,
  onPrimary: Colors.black,
  onSecondary: customWhitePearl,
  onSurface: customSurfaceCoal,
  onBackground: customSurfaceCoal,
  onError: customErrorRed,
  brightness: Brightness.light,
);
