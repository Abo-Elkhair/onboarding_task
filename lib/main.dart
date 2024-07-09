import 'package:flutter/material.dart';
import 'package:tadhil/features/splash/splash_view.dart';

void main() {
  runApp(const Tafsil());
}

class Tafsil extends StatelessWidget {
  const Tafsil({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
