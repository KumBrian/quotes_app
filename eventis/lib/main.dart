import 'package:eventis/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: const EventisApp(),
    ),
  );
}

class EventisApp extends StatelessWidget {
  const EventisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
