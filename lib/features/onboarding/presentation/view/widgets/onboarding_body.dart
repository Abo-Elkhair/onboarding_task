import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tadhil/features/onboarding/presentation/view/widgets/onboarding_item.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/cubit.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnboardingCubit.get(context);
    return PageView.builder(
        onPageChanged: cubit.onPageChanged,
        controller: cubit.pageController,
        reverse: true,
        itemCount: cubit.onboardingList.length,
        itemBuilder: (context, index) {
          log("is last  ${cubit.isLast} index $index");
          return OnBoardingItem(onboardingModel: cubit.onboardingList[index]);
        });
  }
}
