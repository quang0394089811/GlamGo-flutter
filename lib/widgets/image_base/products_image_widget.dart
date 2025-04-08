import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';

class ProductsImageWidget extends StatelessWidget {
  const ProductsImageWidget({
    super.key,
    this.heightImage,
    this.widthImage,
    this.onTap,
    required this.path,
    this.icon,
    this.cacheKey,
    this.errorWidget,
    this.iconSize,
    this.boxFit,
    this.bgrColor,
    this.colorIcon,
    this.isWishList = true,
  });

  final double? heightImage;
  final double? widthImage;
  final VoidCallback? onTap;
  final double? iconSize;
  final String path;
  final String? icon;
  final String? cacheKey;
  final Widget? errorWidget;
  final BoxFit? boxFit;
  final Color? bgrColor, colorIcon;
  final bool isWishList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                alignment: Alignment.topCenter,
                cacheKey: cacheKey,
                fadeInDuration: const Duration(seconds: 0),
                fadeOutDuration: const Duration(seconds: 0),
                height: heightImage ?? Get.height,
                width: widthImage ?? Get.width,
                imageUrl: path,
                filterQuality: FilterQuality.low,
                fit: boxFit ?? BoxFit.cover,
                placeholder: (context, url) {
                  return Image.asset(
                    'assets/images/avatar.png',
                  );
                },
                errorWidget: (context, obj, trace) {
                  return errorWidget ??
                      Image.asset(
                        'assets/images/avatar.png',
                      );
                },
              )),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            // rippleColor: Colors.amber,
            onTap: onTap,
            child: Container(
              width: iconSize ?? 40,
              height: iconSize ?? 40,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: bgrColor ?? ColorName.white,
                borderRadius: BorderRadius.circular(55),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: isWishList
                  ? Image.asset(Assets.images.icHeart.path)
                  : Image.asset(
                      Assets.images.icHeartFill.path,
                      color: colorIcon ?? ColorName.red5,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
