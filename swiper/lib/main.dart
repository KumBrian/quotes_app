import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SwiperApp(),
  ));
}

class SwiperApp extends StatefulWidget {
  const SwiperApp({super.key});

  @override
  State<SwiperApp> createState() => _SwiperAppState();
}

class _SwiperAppState extends State<SwiperApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppinioSwiper(
          cardsBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(index.toString()),
            );
          },
          cardsCount: 5,
          backgroundCardsCount: 3,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 300),
        ),
      ),
    );
  }
}
