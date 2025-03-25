import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/icon_widget/icon_widget.dart';
import 'package:project_shop/widgets/image_base/products_image_widget.dart';
import 'package:project_shop/widgets/simple_row_widget.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class ProductsItemWishlist extends StatelessWidget {
  const ProductsItemWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12),
      color: ColorName.grey53,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProductsImageWidget(
            iconSize: 34,
            heightImage: 120,
            widthImage: Get.width * 0.46,
            bgrColor: ColorName.grey53.withOpacity(0.5),
            boxFit: BoxFit.contain,
            path:
                'https://img.freepik.com/premium-photo/cool-fashion-casual-men-outfit-wooden-table_93675-18917.jpg?semt=ais_hybri',
          ),
          SizedBox(width: 8),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleRowWidget(
                  isWidthSizeBox: 0,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  // textAlign: TextAlign.start,
                  isShowWidget: true,
                  imageFirst: null,
                  contentFirst: 'Áo Hoodie uuuu',
                  styleContent: Styles.normalTextW700(),
                  isSpacer: false,
                  widget: IconWidget.ic12(
                    path: Assets.icons.icStar,
                    color: ColorName.yellow5,
                  ),
                  contentSecond: '3.5',
                ),
                SizedBox(height: 8),
                Text('Giúp tôi sửa đoạn văn trên, giữ nguyên nội dung nhé'),
                SizedBox(height: 8),
                // 
              ],
            ),
          )
        ],
      ),
    );
  }
}
