import 'package:flutter/material.dart';
import 'package:tadhil/core/constants.dart';
import 'package:tadhil/core/utils/app_word.dart';
import 'package:tadhil/features/onboarding/presentation/view_model/cubit/onboarding_cubit.dart';

class BuildOnboardingFooter extends StatelessWidget {
  const BuildOnboardingFooter({
    super.key,
    required this.cubit,
  });

  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: cubit.isLast,
          builder: (context, isLast, child) {
            return Visibility(
              visible: !isLast,
              child: SizedBox(
                width: 163,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    if (isLast) {
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
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    AppWords.continueBtn,
                    style: TextStyle(
                      fontFamily: Constants.fontFamilyCoh,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          },
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
            style: TextStyle(
              fontFamily: Constants.fontFamilyCoh,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
