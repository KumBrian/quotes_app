import 'package:flutter/material.dart';
import 'package:mtn_demo/constants.dart';
import 'package:mtn_demo/screens/numbers_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String id = 'sign_in_screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    String phoneNumber;
    String _pin;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MTN APP DEMO',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffFFC700),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SIGN IN TO ACCOUNT',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              maxLength: 9,
              onChanged: (value) {
                phoneNumber = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'PHONE NUMBER'),
            ),
            const SizedBox(
              height: 28,
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              obscureText: true,
              maxLength: 5,
              obscuringCharacter: '*',
              onChanged: (value) {
                _pin = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'PIN'),
            ),
            const SizedBox(
              height: 28,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, NumbersScreen.id);
              },
              textColor: Colors.white,
              color: const Color(0xffFFC700),
              elevation: 0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text('SIGN IN'),
            ),
          ],
        ),
      ),
    );
  }
}
