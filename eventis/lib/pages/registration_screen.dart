import 'package:flutter/material.dart';

import '../components/input_field.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'app_logo',
              child: Icon(
                Icons.event,
                color: Colors.grey[200],
                size: 120,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Register an Account!',
              style: TextStyle(color: Colors.grey[200], fontSize: 30),
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: emailController,
              hintText: 'Email',
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: MaterialButton(
                onPressed: () {
                  if (passwordController.text ==
                      confirmPasswordController.text) {
                    //implement registration with firebase
                  }
                },
                color: Colors.black54,
                elevation: 1,
                minWidth: double.infinity,
                padding: const EdgeInsets.all(20),
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  })),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
