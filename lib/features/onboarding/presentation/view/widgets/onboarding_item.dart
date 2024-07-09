import 'package:flutter/material.dart';
import 'package:tadhil/core/constants.dart';
import 'package:tadhil/features/onboarding/data/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnBoardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            onboardingModel.title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // width: 120,
            // height: 53,
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              onboardingModel.description,
              style: TextStyle(
                fontFamily: Constants.fontFamilyCoh,
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
