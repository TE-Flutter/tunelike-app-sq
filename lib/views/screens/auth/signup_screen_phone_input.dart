import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:tunelike/domain/repository/user_repository.dart';

import 'package:tunelike/views/components/design.dart';

TextEditingController _phoneController = TextEditingController();

// ignore: camel_case_types
class SignUpScreen_PhoneInput extends StatefulWidget {
  const SignUpScreen_PhoneInput({super.key, required this.user});

  final TuneLikeUser user;

  @override
  State<SignUpScreen_PhoneInput> createState() =>
      // ignore: no_logic_in_create_state
      _SignUpScreen_PhoneInputState(user);
}

// ignore: camel_case_types
class _SignUpScreen_PhoneInputState extends State<SignUpScreen_PhoneInput> {
  _SignUpScreen_PhoneInputState(this.user);
  TuneLikeUser user;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification'), centerTitle: true),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Enter your phone number',
              style: TextStyle(fontFamily: 'Mosk')),
          SizedBox(
            width: 200,
            child: Form(
              key: _formKey,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: _phoneController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'[A-z]'))
                ],
                validator: (value) {
                  RegExp ruNumberRegex = RegExp(
                      r'^(\+7|7|8)?[\s\-]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$');
                  if (!ruNumberRegex.hasMatch(value!)) {
                    return "Example: +7 999 1234567";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(30, 20, 10, 10)),
          Container(
            alignment: Alignment.center,
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: RoundedButtonWidget(
              minSize: const Size(200, 80),
              buttonText: 'Continue',
              onPressed: () => proceedAccountCreate(),
            ),
          ),
        ],
      ),
    );
  }

  void proceedAccountCreate() {
    String number = _phoneController.text;

    if (_formKey.currentState!.validate()) {
      user = user.copyWith(phoneNumber: number);
      FirebaseAuth.instance.currentUser!.linkWithPhoneNumber(number);

      Navigator.pushNamed(context, '/SignUpScreen/PhoneVerification',
          arguments: [number, user]);
    } else {
      //print('Incorrect number input');
    }
  }
}
