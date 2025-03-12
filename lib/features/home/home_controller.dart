import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/base_controller.dart';

class HomeController extends BaseController {
  final RxInt initialIndex = 0.obs;
  late final PageController pageController =
      PageController(initialPage: initialIndex.value);
  void onTabChanged(int index) {
    initialIndex.value = index;
    pageController.jumpToPage(index);
    // bottomBarController.index = index;
  }
}
