import 'package:flutter/material.dart';
import 'package:project_shop/features/products/widget/products_item_wish_list.dart';
import 'package:project_shop/widgets/appbar_custom/custom_app_bar.dart';

class WishListPage extends StatelessWidget {
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
          Expanded(
              child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, _) {
                    return ProductsItemWishlist();
                  }))
        ],
      ),
    ));
  }
}
