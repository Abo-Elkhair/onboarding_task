import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tadhil/core/utils/colors.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/onboarding_cubit.dart';

SmoothPageIndicator smoothPageIndicator(OnboardingCubit cubit) {
  return SmoothPageIndicator(
    controller: cubit.pageController,
    count: cubit.onboardingList.length,
    textDirection: TextDirection.rtl,
    effect: const ExpandingDotsEffect(
      dotColor: AppColor.unSelectedDots,
      activeDotColor: Colors.white,
      dotHeight: 5,
      dotWidth: 10,
    ),
  );
}
