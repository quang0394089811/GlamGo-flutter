import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/icon_widget/icon_widget.dart';
import 'package:project_shop/widgets/image_base/products_image_widget.dart';
import 'package:project_shop/widgets/simple_row_content.dart';
import 'package:project_shop/widgets/simple_row_widget.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class ProductsItemView extends StatelessWidget {
  const ProductsItemView({
    super.key,
    this.name,
    this.path,
    this.widthImage,
    this.heightImage,
    this.iconSize,
    this.onTap,
    this.icon,
    this.cacheKey,
    this.errorWidget,
    this.boxFit,
    this.bgrColor,
    this.price,
    this.priceSale,
    this.starCount,
    this.isWishList = true, this.iconColor,
  });

  final String? name;
  final String? path;
  final double? widthImage, heightImage, iconSize;
  final VoidCallback? onTap;
  final String? icon;
  final String? cacheKey;
  final Widget? errorWidget;
  final BoxFit? boxFit;
  final Color? bgrColor, iconColor;
  final String? price, priceSale, starCount;
  final bool isWishList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.48,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorName.grey53, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ProductsImageWidget(
            path: path ?? '',
            heightImage: heightImage ?? 180,
            widthImage: widthImage ?? Get.width,
            iconSize: iconSize,
            onTap: onTap,
            cacheKey: cacheKey,
            errorWidget: errorWidget,
            boxFit: boxFit,
            bgrColor: bgrColor,
            isWishList: isWishList,
            colorIcon: iconColor,
          ),
          SizedBox(height: 8),
          SimpleRowWidget(
            padding: EdgeInsets.symmetric(horizontal: 4),
            textAlign: TextAlign.start,
            isShowWidget: true,
            imageFirst: null,
            contentFirst: name ?? 'Áo Hoodie uuuu',
            styleContent: Styles.normalTextW700(),
            isSpacer: false,
            widget: IconWidget.ic12(
              path: Assets.icons.icStar,
              color: ColorName.yellow5,
            ),
            contentSecond: starCount ?? '3.5',
          ),
          SimpleRowContent(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            isShowWidget: true,
            contentFirst: price ?? '150\$',
            contentSecond: priceSale ?? '300\$',
          )
        ],
      ),
    );
  }
}
