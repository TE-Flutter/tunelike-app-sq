import 'package:flutter/material.dart';
import 'auth_service.dart';

class AuthProvider extends InheritedWidget {
  final AuthService auth;
  const AuthProvider({
    Key? key,
    required Widget child,
    required this.auth,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AuthProvider? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<AuthProvider>());
}
