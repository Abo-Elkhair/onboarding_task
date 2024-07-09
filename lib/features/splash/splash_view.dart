import 'package:flutter/material.dart';
import 'package:tadhil/core/custom_route.dart';
import 'package:tadhil/core/utils/app_images.dart';
import 'package:tadhil/core/utils/colors.dart';
import 'package:tadhil/features/onboarding/presentation/view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        createRoute(const OnboardingView()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.shamwa,
              AppColor.shamwa.withOpacity(0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
              alignment: Alignment.center,
              image: AssetImage(AppImages.splash),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            width: 166,
            height: 73,
            decoration: BoxDecoration(
                image: DecorationImage(
              alignment: Alignment.center,
              image: AssetImage(AppImages.logo),
            )),
          ),
        ),
      ),
    );
  }
}
