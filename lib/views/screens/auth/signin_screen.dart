import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_input.dart';
import '../../components/rounded_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int validateEmail(String email) {
      String patttern =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      RegExp regExp = RegExp(patttern);
      if (email.isEmpty || email.length == 0) {
        return 1;
      } else if (!regExp.hasMatch(email)) {
        return 3;
      } else {
        return 0;
      }
    }

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(40),
                  child: const Text(
                    'Who are you?',
                    style: TextStyle(fontSize: 20, fontFamily: 'Mosk'),
                  )),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: RoundedInputWidget(
                          controller: emailController,
                          labelText: 'Email',
                          hintText: 'email@tunelike.ru',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined,
                          validateMode: AutovalidateMode.onUserInteraction,
                          validateFunction: (value) {
                            int res = validateEmail(value!);
                            if (res == 1) {
                              return "Please enter email address";
                            } else if (res == 3) {
                              return "Please enter correct email";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: RoundedInputWidget(
                          controller: passwordController,
                          labelText: 'Password',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          validateMode: AutovalidateMode.onUserInteraction,
                          validateFunction: (value) {
                            if (value!.length < 8) {
                              return "Password length should be at least 8 characters";
                            } else if (!value.contains(RegExp(r'[0-9]')) ||
                                !value.contains(RegExp(r'[A-z]'))) {
                              return "Password should have both letters and numbers";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              const Padding(padding: EdgeInsets.all(20)),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignInScreen/ForgotPassword');
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.lime),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RoundedButtonWidget(
                    buttonText: 'Continue',
                    onPressed: proceedLogIn,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20, color: Colors.lime),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context, "/SignUpScreen");
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }

  void proceedLogIn() {
    if (_formKey.currentState!.validate()) {
      print('legit');
    }
  }
}
