import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_shop/base/util/utils.dart';
import 'package:project_shop/features/products/widget/products_item_wish_list.dart';
import 'package:project_shop/features/wishlist/wish_list_controller.dart';
import 'package:project_shop/widgets/appbar_custom/custom_app_bar.dart';

class WishListPage extends GetView<WishListController> {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        label: 'Sản phẩm yêu thích',
        showBackButton: false,
      ),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return ListView.builder(
                itemCount: controller.favoriteProducts.length,
                itemBuilder: (context, index) {
                  final products = controller.favoriteProducts[index];
                  return ProductsItemWishlist(
                    nameProduct: products.name,
                    describe: products.metaDescription,
                    path: Utils.I.getImageFullPath(products.image ?? ''),
                    isWishList: controller.isFavorite(products),
                    onWishListProduct: () =>
                        controller.toggleFavorite(products),
                  );
                });
          }))
        ],
      ),
    ));
  }
}
