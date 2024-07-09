abstract class OnboardingState {}

class OnBoardingIntialState extends OnboardingState {}

class OnBoardingSuccessState extends OnboardingState {}

class OnBoardingErrorState extends OnboardingState {
  final String error;
  OnBoardingErrorState({required this.error});
}

class OnBoardingLoadingState extends OnboardingState {}
// class OnBoardingChangeState extends OnboardingState {}
