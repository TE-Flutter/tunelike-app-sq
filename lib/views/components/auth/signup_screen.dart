import 'package:firebase_core/firebase_core.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Sign Up screen',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen())),
            child: const Text('SignUp'))
      ],
    );
  }
}
