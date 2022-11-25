import 'package:tunelike/views/components/design.dart';
import 'package:tunelike/domain/repository/user_repository.dart';

// ignore: camel_case_types
class SignUpScreen_PhoneVerification extends StatefulWidget {
  const SignUpScreen_PhoneVerification(
      {super.key, required this.phoneNumber, required this.user});

  final String phoneNumber;
  final TuneLikeUser user;

  @override
  State<SignUpScreen_PhoneVerification> createState() =>
      // ignore: no_logic_in_create_state
      _SignUpScreen_PhoneVerificationState(phoneNumber, user);
}

// ignore: camel_case_types
class _SignUpScreen_PhoneVerificationState
    extends State<SignUpScreen_PhoneVerification> {
  String phoneNumber;
  TuneLikeUser user;

  _SignUpScreen_PhoneVerificationState(this.phoneNumber, this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification'), centerTitle: true),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 150,
              child: Text('Please enter the code we\'ve sent to $phoneNumber',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: const TextStyle(fontFamily: 'Mosk')),
            ),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 10)),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 4,
              direction: Axis.horizontal,
              runSpacing: 10,
              children: [
                _otpTextField(context, true),
                _otpTextField(context, false),
                _otpTextField(context, false),
                _otpTextField(context, false),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(20, 40, 20, 10)),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RoundedButtonWidget(
                minSize: const Size(200, 80),
                buttonText: 'Verify',
                onPressed: () => proceedAccountCreate(),
              )),
        ],
      ),
    );
  }

  Widget _otpTextField(BuildContext context, bool autoFocus) {
    return Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onPrimary),
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: autoFocus,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(),
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }

  void proceedAccountCreate() {
    //if code is correct
    Navigator.pushReplacementNamed(context, '/SignUpScreen/Preferences',
        arguments: user);
  }
}
