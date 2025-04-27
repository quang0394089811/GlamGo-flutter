import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/util/utils.dart';
import 'package:project_shop/features/products/products_detail/product_detail_controller.dart';
import 'package:project_shop/features/products/products_detail/widget/item_similar_products.dart';
import 'package:project_shop/gen/assets.gen.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/image_base/base_image_widget.dart';
import 'package:project_shop/widgets/simple_row_content.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';
import 'package:readmore/readmore.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: controller.isLoading.value
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: Get.height * 0.5,
                            child: Obx(() {
                              return Opacity(
                                opacity: controller.isJumping.value ? 0 : 1,
                                child: IgnorePointer(
                                  ignoring: controller.isJumping.value,
                                  child: PageView.builder(
                                    controller: controller.pageController,
                                    onPageChanged: (index) {
                                      controller.scrollThumbnailToIndex(index);
                                    },
                                    itemCount: controller
                                        .productDetail?.productImages?.length,
                                    itemBuilder: (context, index) {
                                      return BaseImageWidget(
                                        boxFit: BoxFit.cover,
                                        path: Utils.I.getImageFullPath(
                                          controller
                                                  .productDetail
                                                  ?.productImages?[index]
                                                  .image ??
                                              '',
                                        ),
                                        // heightImage: Get.height * 0.4,
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                          ),
                          Obx(() {
                            return controller.isJumping.value
                                ? Container(
                                    height: Get.height * 0.5,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.black87,
                                    ),
                                  )
                                : const SizedBox.shrink();
                          }),
                          Positioned(
                            bottom: -40,
                            left: 4,
                            right: 4,
                            child: SizedBox(
                              height: 80,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                        .productDetail?.productImages?.length ??
                                    0,
                                controller:
                                    controller.thumbnailScrollController,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 8),
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () {
                                      return GestureDetector(
                                        onTap: () {
                                          controller
                                              .jumpToPageFromThumbnail(index);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: controller.selectedIndex
                                                              .value ==
                                                          index &&
                                                      !controller
                                                          .isJumping.value
                                                  ? ColorName.blue31
                                                  : ColorName.grey55,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.network(
                                              Utils.I.getImageFullPath(
                                                controller
                                                        .productDetail
                                                        ?.productImages?[index]
                                                        .image ??
                                                    '',
                                              ),
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  padding: EdgeInsets.all(6),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: ColorName.white,
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
                                  child:
                                      Image.asset(Assets.images.icHeart.path)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      SimpleRowContent(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        contentFirst:
                            controller.productDetail?.name ?? 'Rick Owns',
                        firstStyle: Styles.normalTextW800(size: 18),
                        isShowWidget: false,
                      ),
                      SizedBox(height: 8),
                      SimpleRowContent(
                        mainAxisAlignment: MainAxisAlignment.start,
                        contentFirst: '\$699',
                        firstStyle: Styles.normalTextW700(size: 16),
                        widthSizeBox: 30,
                        contentSecond: '\$799',
                        secondStyle:
                            Styles.normalTextW600(color: ColorName.grey1)
                                .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: ColorName.orange13),
                      ),
                      SizedBox(height: 8),
                      const Text('Select Size'),
                      SizedBox(height: 8),
                      Text(
                        'Description',
                        style: Styles.normalTextW600(),
                      ),
                      SizedBox(height: 8),
                      ReadMoreText(
                        controller.productDetail?.metaDescription ??
                            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimMode: TrimMode.Line,
                        trimLines: 2,
                        style:
                            TextStyle(fontSize: 14.sp, color: ColorName.blue31),
                        colorClickableText: ColorName.blue31,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ColorName.blue31,
                        ),
                        moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ColorName.blue31,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 200,
                        color: ColorName.grey1,
                        padding: EdgeInsets.all(4),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            return ItemSimilarProducts(
                              width: Get.width * 0.3,
                              imageHeight: 124,
                              radius: 4,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ),
      ),
    );
  }
}
