import 'package:flutter/material.dart';
import 'package:tadhil/core/utils/colors.dart';
import 'package:tadhil/features/onboarding/presentation/view/widgets/build_onboarding_footer.dart';
import 'package:tadhil/features/onboarding/presentation/view/widgets/onboarding_pageview_builder.dart';
import 'package:tadhil/features/onboarding/presentation/view/widgets/smooth_page_indicator.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/onboarding_cubit.dart';

class OnboardingBuilder extends StatelessWidget {
  const OnboardingBuilder({
    super.key,
    required this.cubit,
  });

  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.shamwa.withOpacity(0),
                AppColor.shamwa,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                cubit.onboardingList[cubit.currentIndex.value].image,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 24, end: 38, bottom: 60),
          child: Column(
            children: [
              onBoardingPageView(cubit),
              const SizedBox(
                height: 16,
              ),
              smoothPageIndicator(cubit),
              const SizedBox(
                height: 30,
              ),
              BuildOnboardingFooter(cubit: cubit),
            ],
          ),
        ),
      ],
    );
  }
}
