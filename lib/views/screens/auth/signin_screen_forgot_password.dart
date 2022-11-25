import 'package:flutter/material.dart';

// ignore: camel_case_types
class SignInScreen_ForgotPassword extends StatefulWidget {
  const SignInScreen_ForgotPassword({super.key});

  @override
  State<SignInScreen_ForgotPassword> createState() =>
      _SignInScreen_ForgotPasswordState();
}

// ignore: camel_case_types
class _SignInScreen_ForgotPasswordState
    extends State<SignInScreen_ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome!'), centerTitle: true),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Oh no, you forgot your password!?',
                style: TextStyle(
                    fontFamily: 'Mosk', fontSize: 26, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Thats sad.',
                style: TextStyle(
                    fontFamily: 'Mosk', fontSize: 48, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ]),
      ),
    );
  }
}
