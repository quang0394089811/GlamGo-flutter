import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/app_exception.dart';
import 'package:project_shop/base/base_controller.dart';
import 'package:project_shop/data/repository/categories_action/categories_repository.dart';
import 'package:project_shop/data/response_models/products/products_model.dart';

class ProductDetailController extends BaseController {
  final RxList<String> imageList = [
    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1016/600/400',
    'https://picsum.photos/id/1018/600/400',
    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1016/600/400',
    'https://picsum.photos/id/1018/600/400',
  ].obs;

  final _categoriesRepository = Get.find<CategoriesRepository>();

  final RxInt selectedIndex = 0.obs;

  PageController pageController = PageController();

  final ScrollController thumbnailScrollController = ScrollController();

  final RxBool isJumping = false.obs;

  final productId = Get.arguments;

  // final RxList<ProductsModel> _productDetail = <ProductsModel>[].obs;
  // List<ProductsModel> get productDetail => _productDetail;

  final Rxn<ProductsModel> _productDetail = Rxn<ProductsModel>();
  ProductsModel? get productDetail => _productDetail.value;

  RxBool isLoading = false.obs;

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

  Future<void> getProductDetail(int? productId) async {
    try {
      isLoading.value = true;
      final response = await _categoriesRepository.getProductDetail(productId);
      response.fold(
        (error) {
          appException.value = error;
          isLoading.value = false;
        },
        (result) {
          _productDetail.value = result.data;
          isLoading.value = false;
          // _isLoadingProduct.value = false;
        },
      );
    } catch (e, stackTrace) {
      appException.value = AppException(message: e.toString());
      print("Error Exception: $stackTrace");
      isLoading.value = false;
      // _isLoadingProduct.value = false;
    }
  }

  @override
  void onReady() {
    getProductDetail(productId);
    super.onReady();
  }
}
