import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/products/widget/products_item_wish_list.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/button/normal_button.dart';
import 'package:project_shop/widgets/custom_divider.dart';
import 'package:project_shop/widgets/simple_row_content.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, _) {
                  return ProductsItemWishlist(
                    isItemWishList: false,
                    // onWishListProduct: () {
                      
                    // },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: Get.height * 0.24,
          decoration: BoxDecoration(
              color: ColorName.grey53,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Column(
            children: [
              SimpleRowContent(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                firstStyle: Styles.normalTextW500(size: 16),
                secondStyle: Styles.normalTextBold(size: 16),
                contentFirst: 'Order Amount',
                contentSecond: '2445.00\$',
              ),
              CustomDivider(
                type: DividerType.dashed,
                dashSpace: 5,
                color: ColorName.grey1,
              ),
              SizedBox(height: 8),
              SimpleRowContent(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                firstStyle: Styles.normalTextW500(size: 16),
                secondStyle: Styles.normalTextBold(size: 16),
                contentFirst: 'Discount',
                contentSecond: '115.00\$',
              ),
              CustomDivider(
                type: DividerType.dashed,
                dashSpace: 5,
                color: ColorName.grey1,
              ),
              SizedBox(height: 8),
              SimpleRowContent(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                firstStyle: Styles.normalTextBold(size: 16),
                secondStyle: Styles.normalTextBold(size: 16),
                contentFirst: 'Total Payment',
                contentSecond: '125.00\$',
              ),
              CustomDivider(
                type: DividerType.dashed,
                dashSpace: 5,
                color: ColorName.grey1,
              ),
              SizedBox(height: 8),
              IButton.primaryNormal(
                height: 46,
                title: 'Checkout',
                textStyle:
                    Styles.normalTextW500(color: ColorName.white, size: 16),
                radius: 30,
                backgroundColor: ColorName.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
