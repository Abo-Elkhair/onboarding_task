import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadhil/features/onboarding/presentation/view/widgets/onboarding_body.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/cubit.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/states.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnboardingCubit(),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return const OnboardingBody();
          },
        ),
      ),
    );
  }
}
