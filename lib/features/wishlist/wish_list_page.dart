import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_shop/features/products/widget/products_item_wish_list.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
