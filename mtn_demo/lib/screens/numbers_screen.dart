import 'package:flutter/material.dart';
import 'package:mtn_demo/screens/success_screen.dart';

import '../components/new_number_field.dart';
import '../constants.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});
  static String id = 'numbers_screen';
  static List phoneNumbers = [];
  static List<NewNumberField> phoneNumberFields = [];

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  void addNewNumber(String number) {
    NumbersScreen.phoneNumbers.add(number);
  }

  Widget _newPhoneNumbersList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: NumbersScreen.phoneNumberFields.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: NumbersScreen.phoneNumberFields[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';
    String amount;

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
            Expanded(
              child: NumbersScreen.phoneNumberFields.isEmpty
                  ? const Text('No Phone Numbers Added Yet')
                  : _newPhoneNumbersList(),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  NumbersScreen.phoneNumberFields.add(const NewNumberField());
                });
              },
              textColor: Colors.white,
              color: const Color(0xffFFC700),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text('ADD NEW NUMBER'),
            ),
            const SizedBox(
              height: 46,
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (value) {
                amount = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'AMOUNT'),
            ),
            const SizedBox(
              height: 46,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, SuccessScreen.id);
              },
              textColor: Colors.white,
              color: const Color(0xffFFC700),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text('SEND'),
            ),
          ],
        ),
      ),
    );
  }
}
