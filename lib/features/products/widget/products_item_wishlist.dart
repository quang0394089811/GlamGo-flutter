import 'package:flutter/material.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/image_base/products_image_widget.dart';

class ProductsItemWishlist extends StatelessWidget {
  const ProductsItemWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.grey53,
      child: Row(
        children: [
          ProductsImageWidget(
            path:
                'https://img.freepik.com/premium-photo/cool-fashion-casual-men-outfit-wooden-table_93675-18917.jpg?semt=ais_hybri',
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Text('Giúp tôi sửa đoạn văn trên, giữ nguyên nội dung nhé')
              ],
            ),
          )
        ],
      ),
    );
  }
}
