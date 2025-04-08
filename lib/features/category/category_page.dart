import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/category/category_controller.dart';
import 'package:project_shop/features/category/widget/item_categories.dart';
import 'package:project_shop/features/products/widget/products_item_view.dart';
import 'package:project_shop/gen/colors.gen.dart';
import 'package:project_shop/widgets/styles_widget/styles_widget.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 6),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listCategories.length,
                      itemBuilder: (context, index) {
                        return ItemCategories(
                          selectedIndex: controller.selectedIndex,
                          index: index,
                          categoryName: controller.listCategories[index].name,
                          onTap: () {
                            controller.onChangeIndex(index);
                          },
                        );
                      },
                    ),
                  ),
                  Text(
                    controller.listCategories.isNotEmpty
                        ? "Bạn đã chọn: ${controller.listCategories[controller.selectedIndex].name}"
                        : "Không có danh mục nào",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (context, index) {
                        return ProductsItemView();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
