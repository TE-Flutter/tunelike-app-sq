import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/rounded_button.dart';

TextEditingController _phoneController = TextEditingController();

// ignore: camel_case_types
class SignUpScreen_PhoneInput extends StatefulWidget {
  const SignUpScreen_PhoneInput({super.key});

  @override
  State<SignUpScreen_PhoneInput> createState() =>
      _SignUpScreen_PhoneInputState();
}

// ignore: camel_case_types
class _SignUpScreen_PhoneInputState extends State<SignUpScreen_PhoneInput> {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 60),
            child: SizedBox(
              width: 200,
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
              )),
        ],
      ),
    );
  }

  void proceedAccountCreate() {
    String number = _phoneController.text;
    RegExp ruNumberRegex = RegExp(
        r'^(\+7|7|8)?[\s\-]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$');
    if (ruNumberRegex.hasMatch(number)) {
      Navigator.pushNamed(context, '/SignUpScreen/PhoneVerification',
          arguments: number);
    } else {
      print('Incorrect number input');
    }
  }
}
