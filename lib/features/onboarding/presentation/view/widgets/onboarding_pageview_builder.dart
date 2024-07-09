import 'package:flutter/material.dart';
import 'package:tadhil/features/onboarding/presentation/view/widgets/onboarding_item.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/onboarding_cubit.dart';

Expanded onBoardingPageView(OnboardingCubit cubit) {
  return Expanded(
    child: PageView.builder(
      onPageChanged: cubit.onPageChanged,
      controller: cubit.pageController,
      itemCount: cubit.onboardingList.length,
      itemBuilder: (context, index) {
        return OnBoardingItem(
          onboardingModel: cubit.onboardingList[index],
        );
      },
    ),
  );
}
