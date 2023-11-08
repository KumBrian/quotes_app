import 'package:eventis/pages/registration_screen.dart';
import 'package:flutter/material.dart';

import '../components/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                size: 150,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Welcome Back To Eventis!',
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
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      //implement forgot password with firebase
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: MaterialButton(
                onPressed: () {
                  //implement signIn with firebase
                },
                color: Colors.black54,
                elevation: 1,
                minWidth: double.infinity,
                padding: const EdgeInsets.all(20),
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const RegistrationPage();
                  })),
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
