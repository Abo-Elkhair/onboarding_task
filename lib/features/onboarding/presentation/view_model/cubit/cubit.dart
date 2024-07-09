import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadhil/core/network/dio_helper.dart';

import 'package:tadhil/features/onboarding/data/onboarding_model.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/states.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnBoardingIntialState());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  List<OnboardingModel> onboardingList = [];
  PageController pageController = PageController();
  ValueNotifier<bool> isLast = ValueNotifier<bool>(false);
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0); // Add this line

  Future<void> getOnBoardingData() async {
    emit(OnBoardingLoadingState());
    try {
      final response = await DioHelper.getData(path: 'splash');
      final List<dynamic> data = response.data['data'];
      onboardingList =
          data.map((item) => OnboardingModel.fromJson(item)).toList();
      emit(OnBoardingSuccessState());
    } catch (error) {
      emit(OnBoardingErrorState(error: error.toString()));
    }
  }

  void onPageChanged(int value) {
    currentIndex.value = value; // Update the current index
    if (value == onboardingList.length - 1) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
  }
}
