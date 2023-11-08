import 'package:flutter/material.dart';
import 'package:mtn_demo/screens/numbers_screen.dart';
import 'package:mtn_demo/screens/sign_in_screen.dart';
import 'package:mtn_demo/screens/success_screen.dart';

void main() {
  runApp(const MTNApp());
}

class MTNApp extends StatelessWidget {
  const MTNApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignInScreen.id: (context) => const SignInScreen(),
        NumbersScreen.id: (context) => const NumbersScreen(),
        SuccessScreen.id: (context) => const SuccessScreen(),
      },
      initialRoute: SignInScreen.id,
    );
  }
}
