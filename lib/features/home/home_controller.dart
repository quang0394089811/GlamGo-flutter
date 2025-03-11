import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/base_controller.dart';

class HomeController extends BaseController {
  final RxInt initialIndex = 0.obs;
  // static int initialIndex = 0;
  // final NotchBottomBarController bottomBarController = NotchBottomBarController(index: initialIndex);
  late final PageController pageController =
      PageController(initialPage: initialIndex.value);
  void onTabChanged(int index) {
    initialIndex.value = index;
    pageController.jumpToPage(index);
    // bottomBarController.index = index;
  }
}
