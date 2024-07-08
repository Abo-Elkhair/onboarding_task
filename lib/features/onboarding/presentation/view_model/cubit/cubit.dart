import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadhil/core/utils/app_images.dart';
import 'package:tadhil/core/utils/app_word.dart';
import 'package:tadhil/features/onboarding/data/onboarding_model.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/states.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnBoardingIntialState());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  List<OnboardingModel> onboardingList = [
    OnboardingModel(
        backgroundImg: AppImages.onboardingFirst,
        logo: AppImages.logo,
        description: AppWords.onBoardFirsDesc),
    OnboardingModel(
        backgroundImg: AppImages.onboardingSecond,
        logo: AppImages.logo,
        description: AppWords.onBoardSecDesc),
    OnboardingModel(
        backgroundImg: AppImages.onboardingThird,
        logo: AppImages.logo,
        description: AppWords.onBoardThirdDesc),
  ];

  PageController pageController = PageController();
  ValueNotifier<bool> isLast = ValueNotifier<bool>(false);

  void onPageChanged(int value) {
    if (value == onboardingList.length - 1) {
      isLast.value = true;

    } else {
      isLast.value = false;

    }
  }
}
