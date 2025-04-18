import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/base_controller.dart';

class ProductDetailController extends BaseController {
  final RxList<String> imageList = [
    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1016/600/400',
    'https://picsum.photos/id/1018/600/400',
    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1016/600/400',
    'https://picsum.photos/id/1018/600/400',
  ].obs;

  final RxInt selectedIndex = 0.obs;

  PageController pageController = PageController();

  final ScrollController thumbnailScrollController = ScrollController();

  final RxBool isJumping = false.obs;

  void jumpToPageFromThumbnail(int index) async {
    if (selectedIndex.value == index) return;

    isJumping.value = true;
    await pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    await Future.delayed(const Duration(milliseconds: 50));

    selectedIndex.value = index;
    isJumping.value = false;

    scrollThumbnailToIndex(index);
  }

  void scrollThumbnailToIndex(int index) {
    selectedIndex.value = index;

    final double itemWidth = 70 + 8;
    final double targetScrollOffset =
        itemWidth * index - Get.width / 2 + itemWidth / 2;

    thumbnailScrollController.animateTo(
      targetScrollOffset.clamp(
        thumbnailScrollController.position.minScrollExtent,
        thumbnailScrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
