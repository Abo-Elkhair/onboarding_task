import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadhil/features/onboarding/presentation/view/widgets/onboarding_builder.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/onboarding_cubit.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/onboarding_states.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnboardingCubit.get(context);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        if (state is OnBoardingSuccessState) {
          return ValueListenableBuilder<int>(
            valueListenable: cubit.currentIndex,
            builder: (context, currentIndex, child) {
              return OnboardingBuilder(cubit: cubit);
            },
          );
        } else if (state is OnBoardingErrorState) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
