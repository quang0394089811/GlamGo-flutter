import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/account/account_page.dart';
import 'package:project_shop/features/home/home_controller.dart';
import 'package:project_shop/features/login/login_page.dart';
import 'package:project_shop/features/onboarding/onboarding_page.dart';
import 'package:project_shop/features/splash/splash_page.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/generated/colors.gen.dart';
import 'package:project_shop/widgets/icon_widget/icon_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
          controller: controller.pageController,
          itemCount: 3,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return LoginPage();
              case 1:
                return OnboardingPage();
              case 2:
                return AccountPage();
              default:
                return Container();
            }
          }),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: EdgeInsets.all(30),
        backgroundColor: ColorName.white,
        snakeViewColor: ColorName.black.withOpacity(0.1),
        currentIndex: controller.initialIndex.value,
        selectedItemColor: ColorName.green1,
        onTap: (index) {
          controller.onTabChanged(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: IconWidget.ic24(path: Assets.icons.icHome),
              label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: IconWidget.ic24(
                path: Assets.icons.notify,
                color: ColorName.red5,
              ),
              label: 'Sản Phẩm'),
          BottomNavigationBarItem(
              icon: IconWidget.ic24(
                path: Assets.icons.icUser,
                color: ColorName.red5,
              ),
              label: 'Thông tin'),
        ],
      ),
    );
  }
}

class CustomBottomBarItem extends BottomBarItem {
  final String label;

  const CustomBottomBarItem(
      {required super.inActiveItem,
      required super.activeItem,
      required this.label});

  @override
  Widget? get itemLabelWidget => Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
}
