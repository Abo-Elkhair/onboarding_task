import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadhil/core/network/dio_helper.dart';

import 'package:tadhil/features/onboarding/data/onboarding_model.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/states.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnBoardingIntialState());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  List<OnboardingModel> onboardingList = [];

  getOnBoardingData() async {
    emit(OnBoardingLoadingState());
    await DioHelper.getData(path: 'splash').then((value) {
      print(value.data);
      onboardingList = (value.data["data"] as List<dynamic>)
          .map((e) => OnboardingModel.fromJson(e))
          .toList();
      emit(OnBoardingSuccessState());
    }).catchError((onError) {
      emit(OnBoardingErrorState(error: onError.toString()));
    });
  }

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
