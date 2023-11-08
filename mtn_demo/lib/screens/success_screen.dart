import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});
  static String id = 'success_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  color: Color(0xffFFC700),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              'SUCCESSFUL',
              style: TextStyle(
                color: Color(0xff25E567),
                fontWeight: FontWeight.bold,
                fontSize: 37,
              ),
            ),
            const SizedBox(
              height: 72,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  title: const Text(
                    'GO BACK',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  tileColor: const Color(0xffFFC700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
