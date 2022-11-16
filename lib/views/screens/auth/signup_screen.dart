import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/rounded_input.dart';
import 'package:course_example_app/views/components/rounded_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:course_example_app/domain/repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
      appBar: AppBar(title: const Text('Create account'), centerTitle: true),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(40),
                  child: const Text(
                    'Welcome to TuneLike!',
                    style: TextStyle(fontSize: 20, fontFamily: 'Mosk'),
                  )),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: RoundedInputWidget(
                          controller: firstNameController,
                          labelText: 'First Name',
                          hintText: 'John',
                          keyboardType: TextInputType.name,
                          prefixIcon: Icons.person_rounded,
                          validateMode: AutovalidateMode.onUserInteraction,
                          validateFunction: (value) {
                            if (value!.isEmpty) {
                              return "What is your name mate?";
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: RoundedInputWidget(
                          controller: secondNameController,
                          labelText: 'Second Name',
                          hintText: 'Smith',
                          keyboardType: TextInputType.name,
                          prefixIcon: Icons.person_rounded,
                          validateMode: AutovalidateMode.onUserInteraction,
                          validateFunction: (value) {
                            if (value!.isEmpty) {
                              return "Please tell us your surname";
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: RoundedInputWidget(
                          controller: emailController,
                          labelText: 'Email',
                          hintText: 'example@tunelike.ru',
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
                        padding: const EdgeInsets.all(10),
                        child: RoundedInputWidget(
                          controller: passwordController,
                          labelText: 'Password',
                          isPassword: true,
                          prefixIcon: Icons.lock_outline,
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
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RoundedButtonWidget(
                    buttonText: 'Create account',
                    onPressed: () => proceedAccountCreate(),
                  )),
              //social buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => proceedAccountCreate(regType: 'yandex'),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.5,
                              color: Theme.of(context).colorScheme.onSurface,
                              offset: const Offset(0, 1),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.yandex,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => proceedAccountCreate(regType: 'apple'),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.5,
                              color: Theme.of(context).colorScheme.onSurface,
                              offset: const Offset(0, 1),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.apple,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => proceedAccountCreate(regType: 'vk'),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.5,
                              color: Theme.of(context).colorScheme.onSurface,
                              offset: const Offset(0, 1),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.vk,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => proceedAccountCreate(regType: 'spotify'),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.5,
                              color: Theme.of(context).colorScheme.onSurface,
                              offset: const Offset(0, 1),
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.spotify,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void proceedAccountCreate({String? regType}) {
    TuneLikeUser user = TuneLikeUser(
        firstName: firstNameController.text,
        lastName: secondNameController.text,
        userName: '',
        email: emailController.text,
        password: passwordController.text,
        phoneNumber: '');

    switch (regType) {
      case 'yandex':
        //proceed yandex reg
        break;
      case 'apple':
        //apple reg
        break;
      case 'vk':
        //vk reg
        break;
      case 'spotify':
        //spotify reg
        break;
      default:
        RegExp simpleEmailRegex = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if (user.firstName.isNotEmpty &&
            user.lastName.isNotEmpty &&
            user.password.length >= 8 &&
            simpleEmailRegex.hasMatch(user.email)) {
          Navigator.pushReplacementNamed(context, '/SignUpScreen/PhoneInput');
        } else {
          print('input data is incorrect');
        }
        //normal reg with controller values
        break;
    }
  }
}
