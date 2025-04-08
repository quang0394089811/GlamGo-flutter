import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/onboarding/onboarding_controller.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/button/normal_button.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Stack(
            children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: controller.onChangePage,
                children: [
                  OnboardingPage(),
                  OnboardingPage(image: Assets.images.initCarousel.path),
                  OnboardingPage(),
                ],
              ),
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    controller.skipPage();
                  },
                  child: controller.initialIndex.value == 2
                      ? SizedBox()
                      : Text(
                          'Skip',
                          style: Styles.normalTextW600(color: ColorName.purple),
                        ),
                ),
              ),
              Positioned(
                  bottom: 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: controller.initialIndex.value == index
                                  ? 10
                                  : 6,
                              height: controller.initialIndex.value == index
                                  ? 10
                                  : 6,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.initialIndex.value == index
                                    ? ColorName.black
                                    : ColorName.grey50,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 12),
                      Obx(() {
                        return IButton.primaryNormal(
                          title: controller.isLastPage.value
                              ? 'Get Started'
                              : 'Next',
                          height: 46,
                          radius: 50,
                          onPress: () {
                            controller.getStarted();
                          },
                          backgroundColor: controller.isLastPage.value
                              ? ColorName.black
                              : ColorName.grey53,
                          isDisable: false,
                          textColor: controller.isLastPage.value
                              ? ColorName.white
                              : ColorName.black,
                        );
                      }),
                    ],
                  )),
            ],
          );
        }),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    this.image,
    this.title,
    this.describe,
  });

  final String? title, describe, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              image ?? Assets.images.introImage.path,
              width: Get.width * 0.9,
              height: Get.height * 0.6,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Discovery Trends",
            style: Styles.bigTextW700(),
          ),
          SizedBox(height: 8),
          Text(
            "Now we are here to provider variety of the best fashion",
            style: Styles.normalTextW500(),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
