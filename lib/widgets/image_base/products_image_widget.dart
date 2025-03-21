import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/inkwell/default_ink_well.dart';

class ProductsImageWidget extends StatelessWidget {
  const ProductsImageWidget({
    super.key,
    this.heightImage,
    this.widthImage,
    this.onTap,
    this.stackTop,
    this.stackRight,
    required this.path,
    this.icon,
    this.cacheKey,
    this.errorWidget,
    this.iconSize,
  });

  final double? heightImage;
  final double? widthImage;
  final VoidCallback? onTap;
  final double? stackTop, stackRight;
  final double? iconSize;
  final String path;
  final String? icon;
  final String? cacheKey;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          color: ColorName.white,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                alignment: Alignment.topCenter,
                cacheKey: cacheKey,
                fadeInDuration: const Duration(seconds: 0),
                fadeOutDuration: const Duration(seconds: 0),
                height: heightImage ?? 250,
                width: widthImage ?? 200,
                imageUrl: path,
                filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
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
          top: 12,
          right: 14,
          child: DefaultInkWell(
            // rippleColor: Colors.amber,
            onTap: onTap,
            child: Container(
              width: iconSize ?? 40,
              height: iconSize ?? 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(55)),
              child: Image.asset(
                icon ?? Assets.images.icHeart.path,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
