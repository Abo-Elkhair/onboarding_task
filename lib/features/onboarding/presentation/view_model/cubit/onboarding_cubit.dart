// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tadhil/core/network/dio_helper.dart';

// import 'package:tadhil/features/onboarding/data/onboarding_model.dart';
// import 'package:tadhil/features/onboarding/presentation/view_model/cubit/onboarding_states.dart';

// class OnboardingCubit extends Cubit<OnboardingState> {
//   OnboardingCubit() : super(OnBoardingIntialState());
//   static OnboardingCubit get(context) => BlocProvider.of(context);

//   List<OnboardingModel> onboardingList = [];
//   PageController pageController = PageController();
//   ValueNotifier<bool> isLast = ValueNotifier<bool>(false);
//   ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

//   Future<void> getOnBoardingData() async {
//     emit(OnBoardingLoadingState());
//     try {
//       final response = await DioHelper.getData(path: 'splash');
//       final List<dynamic> data = response.data['data'];
//       onboardingList =
//           data.map((item) => OnboardingModel.fromJson(item)).toList();
//       emit(OnBoardingSuccessState());
//     } catch (error) {
//       emit(OnBoardingErrorState(error: error.toString()));
//     }
//   }

//   void onPageChanged(int value) {
//     currentIndex.value = value; // Update the current index
//     if (value == onboardingList.length - 1) {
//       isLast.value = true;
//     } else {
//       isLast.value = false;
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadhil/core/network/dio_helper.dart';

import 'package:tadhil/features/onboarding/data/onboarding_model.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/onboarding_states.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnBoardingIntialState());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  List<OnboardingModel> onboardingList = [];
  PageController pageController = PageController();
  ValueNotifier<bool> isLast = ValueNotifier<bool>(false);
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0); // Add this line

  Future<void> getOnBoardingData() async {
    bool? isCached;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(OnBoardingLoadingState());
    try {
      final response = await DioHelper.getData(path: 'splash');
      final List<dynamic> data = response.data['data'];
      onboardingList =
          data.map((item) => OnboardingModel.fromJson(item)).toList();
      emit(OnBoardingSuccessState());
      isCached = await prefs.setString(
          "cachedList", jsonEncode(onboardingList.toString()));
      log("cachedList: $isCached");
    } catch (error) {
      _getCacheData();
    }
  }

  _getCacheData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedList = prefs.get("cachedList");
    log("////////////////////////////////// 0");

    // if (cachedList != null) {
    //   try {
    //     log("////////////////////////////////// 1");
    //     onboardingList = jsonDecode(cachedList.toString()).map((item) => OnboardingModel.fromJson(item)).toList();
    //     log("////////////////////////////////// 2");
    //   } on Exception catch (e) {
    //     onboardingList = OnboardingModel.onBoardingList;
    //     emit(OnBoardingErrorState(error: "No cached data"));
    //   }
    //
    // }
    // else {
    onboardingList = OnboardingModel.onBoardingList;
    emit(OnBoardingErrorState(error: "No cached data"));
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
