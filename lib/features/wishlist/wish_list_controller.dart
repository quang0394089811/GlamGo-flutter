import 'dart:convert';

import 'package:get/get.dart';
import 'package:project_shop/base/base_controller.dart';
import 'package:project_shop/data/response_models/products/products_model.dart';
import 'package:project_shop/data/secure_storage/share_preference_manager.dart';
import 'package:project_shop/utils/constant.dart';

class WishListController extends BaseController {
  final SharedPreferencesManager prefManager = Get.find();

  final RxList<ProductsModel> _favoriteProducts = <ProductsModel>[].obs;

  List<ProductsModel> get favoriteProducts => _favoriteProducts;

  Future<void> loadFavoriteProducts() async {
    final List<String>? storedProducts =
        prefManager.getStringList(Constant.KEY_WISH_LIST_PRODUCTS);
    if (storedProducts != null) {
      final products = storedProducts
          .map((e) => ProductsModel.fromJson(jsonDecode(e)))
          .toList();
      _favoriteProducts.assignAll(products);
    }
  }

  Future<void> addToFavorites(ProductsModel product) async {
    _favoriteProducts.add(product);
    final wishProducts =
        _favoriteProducts.map((e) => jsonEncode(e.toJson())).toList();
    await prefManager.putStringList(
        Constant.KEY_WISH_LIST_PRODUCTS, wishProducts);
    Get.snackbar('Thành công', 'Đã thêm vào yêu thích');
  }

  Future<void> removeFromFavorites(ProductsModel product) async {
    _favoriteProducts.removeWhere((e) => e.id == product.id);
    final wishProducts =
        _favoriteProducts.map((e) => jsonEncode(e.toJson())).toList();
    await prefManager.putStringList(
        Constant.KEY_WISH_LIST_PRODUCTS, wishProducts);
    Get.snackbar('Đã xóa', 'Đã xóa sản phẩm khỏi yêu thích');
  }

  Future<void> toggleFavorite(ProductsModel product) async {
    final isExist = _favoriteProducts.any((e) => e.id == product.id);
    if (isExist) {
      await removeFromFavorites(product);
    } else {
      await addToFavorites(product);
    }
  }

  bool isFavorite(ProductsModel? product) {
    return _favoriteProducts.any((e) => e.id == product?.id);
  }

  @override
  void onReady() {
    loadFavoriteProducts();
    super.onReady();
  }
}
