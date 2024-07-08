import 'package:flutter/material.dart';
import 'package:tadhil/features/onboarding/presentation/view/onboarding_view.dart';

void main() {
  runApp(const Tadhil());
}

class Tadhil extends StatelessWidget {
  const Tadhil({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingView(),
    );
  }
}
