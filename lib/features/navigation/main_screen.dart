import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/account/account_page.dart';
import 'package:project_shop/features/category/category_page.dart';
import 'package:project_shop/features/home/home_page.dart';
import 'package:project_shop/features/navigation/main_screen_controller.dart';
import 'package:project_shop/features/navigation/widget/enum_type.dart';
import 'package:project_shop/features/onboarding/onboarding_page.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/icon_widget/icon_widget.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        body: PageView.builder(
            controller: controller.pageController,
            itemCount: MainScreenEnum.values.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              switch (MainScreenEnum.values[index]) {
                case MainScreenEnum.home:
                  return HomePage();
                case MainScreenEnum.category:
                  return CategoryPage();
                case MainScreenEnum.onboarding:
                  return OnboardingPage();
                case MainScreenEnum.account:
                  return AccountPage();
              }
            }),
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 6.w),
          backgroundColor: ColorName.white,
          snakeViewColor: ColorName.black.withOpacity(0.8),
          currentIndex: controller.currentPage.value.index,
          selectedItemColor: ColorName.red5,
          onTap: (index) {
            controller.onTabChanged(index);
          },
          items: MainScreenEnum.values.map((page) {
            return BottomNavigationBarItem(
              icon: IconWidget.ic24(
                path: _getIconPath(page),
                color: controller.currentPage.value == page
                    ? ColorName.white
                    : ColorName.doveGrey,
              ),
              label: _getLabel(page),
            );
          }).toList(),
        ),
      );
    });
  }
}

String _getIconPath(MainScreenEnum page) {
  switch (page) {
    case MainScreenEnum.home:
      return Assets.icons.icHomeOutlined;
    case MainScreenEnum.category:
      return Assets.icons.icStore;
    case MainScreenEnum.onboarding:
      return Assets.icons.icNotification;
    case MainScreenEnum.account:
      return Assets.icons.icUser;
  }
}

String _getLabel(MainScreenEnum page) {
  switch (page) {
    case MainScreenEnum.home:
      return 'Trang chủ';
    case MainScreenEnum.category:
      return 'Danh mục';
    case MainScreenEnum.onboarding:
      return 'Sản phẩm';
    case MainScreenEnum.account:
      return 'Thông tin';
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
