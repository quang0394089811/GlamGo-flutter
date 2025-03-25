import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/onboarding/onboarding_controller.dart';
import 'package:project_shop/features/products/widget/products_item_wishlist.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/button/normal_button.dart';
import 'package:project_shop/widgets/image_base/products_image_widget.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            ProductsImageWidget(
              path:
                  'https://img.freepik.com/premium-photo/cool-fashion-casual-men-outfit-wooden-table_93675-18917.jpg?semt=ais_hybri',
            ),
            Text('OnBoarding Page'),
            ProductsItemWishlist(
              isWishList: false,
            )
          ],
        )),
      ),
    );
  }
}
