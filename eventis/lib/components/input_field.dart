import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        cursorColor: Colors.grey[500],
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 20),
          fillColor: Colors.grey.withOpacity(0.2),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
