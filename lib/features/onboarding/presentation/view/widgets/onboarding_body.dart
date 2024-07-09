import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tadhil/core/utils/app_word.dart';
import 'package:tadhil/core/utils/colors.dart';
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
          return ValueListenableBuilder<int>(
            valueListenable: cubit.currentIndex, // Listen to the current index
            builder: (context, currentIndex, child) {
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
                          cubit.onboardingList[currentIndex]
                              .image, // Update the background image
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 24, end: 38, bottom: 60),
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            onPageChanged: cubit.onPageChanged,
                            controller: cubit.pageController,
                            itemCount: cubit.onboardingList.length,
                            itemBuilder: (context, index) {
                              return OnBoardingItem(
                                onboardingModel: cubit.onboardingList[index],
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SmoothPageIndicator(
                          controller: cubit.pageController,
                          count: cubit.onboardingList.length,
                          textDirection: TextDirection.ltr,
                          effect: const ExpandingDotsEffect(
                            dotColor: AppColor.unSelectedDots,
                            activeDotColor: Colors.white,
                            dotHeight: 5,
                            dotWidth: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 163,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                onPressed: () {
                                  if (cubit.isLast.value) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const Scaffold(
                                          body: Center(
                                            child: Text('Login'),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    cubit.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: cubit.isLast,
                                  builder: (context, isLast, child) => Text(
                                    !isLast
                                        ? AppWords.continueBtn
                                        : AppWords.login,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Scaffold(
                                      body: Center(
                                        child: Text('Login'),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                AppWords.skip,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
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
