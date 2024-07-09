import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadhil/features/onboarding/presentation/view/widgets/onboarding_item.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/cubit.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/states.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnboardingCubit.get(context);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        if (state is OnBoardingSuccessState) {
          return PageView.builder(
              onPageChanged: cubit.onPageChanged,
              controller: cubit.pageController,
              itemCount: cubit.onboardingList.length,
              itemBuilder: (context, index) {
                // log("is last  ${cubit.isLast} index $index");
                return OnBoardingItem(
                    onboardingModel: cubit.onboardingList[index]);
              });
        } else if (state is OnBoardingErrorState) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
