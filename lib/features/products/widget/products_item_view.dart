import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/icon_widget/icon_widget.dart';
import 'package:project_shop/widgets/inkwell/default_ink_well.dart';
import 'package:project_shop/widgets/simple_row_widget.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class ProductsItemView extends StatelessWidget {
  const ProductsItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: ColorName.grey53, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Container(
                // padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(12)),
                height: 180,
                width: Get.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      Assets.images.initCarousel.path,
                      fit: BoxFit.cover,
                    ),),
              ),
              SizedBox(height: 9),
              SimpleRowWidget(
                padding: 0,
                textAlign: TextAlign.start,
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
              SimpleRowWidget(
                padding: 0,
                isShowWidget: true,
                imageFirst: null,
                contentFirst: '300\$',
                contentSecond: '350\$',
                styleContentSecond:
                    Styles.normalTextW400(color: ColorName.grey17).copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: ColorName.black),
                disableOnclick: true,
                widget: Image.asset(
                  Assets.images.avatar.path,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 12,
          right: 14,
          child: DefaultInkWell(
            // rippleColor: Colors.amber,
            onTap: () {
              print('dhsfkhfkdsfds');
            },
            child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(55)),
                child: Image.asset(
                  Assets.images.icHeart.path,
                )),
          ),
        ),
      ],
    );
  }
}
