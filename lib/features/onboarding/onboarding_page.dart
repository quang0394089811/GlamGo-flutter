import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/onboarding/onboarding_controller.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/button/normal_button.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text('OnBoarding Page')),
      ),
    );
  }
}
