import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/numbers_screen.dart';

class NewNumberField extends StatefulWidget {
  const NewNumberField({
    super.key,
  });

  @override
  State<NewNumberField> createState() => _NewNumberFieldState();
}

class _NewNumberFieldState extends State<NewNumberField> {
  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 215,
          child: TextField(
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center,
            maxLength: 9,
            onChanged: (value) {
              phoneNumber = value;
            },
            decoration: kTextFieldDecoration.copyWith(
                hintText: 'PHONE NUMBER',
                hintStyle: const TextStyle(fontSize: 18)),
          ),
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              NumbersScreen.phoneNumbers.add(phoneNumber);
            });
          },
          textColor: Colors.white,
          color: const Color(0xffFFC700),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 21),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Text('ADD'),
        ),
      ],
    );
  }
}
