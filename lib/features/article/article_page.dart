import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/base/util/utils.dart';
import 'package:project_shop/features/article/article_controller.dart';
import 'package:project_shop/features/article/widgets/item_article.dart';
import 'package:project_shop/features/category/widget/item_categories.dart';
import 'package:project_shop/utils/extension/extension.dart';

class ArticlePage extends GetView<ArticleController> {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 40,
                  minWidth: Get.width,
                ),
                child: Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listCategoriesArticle.length + 1,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        if (index == 0) {
                          return ItemCategories(
                            radius: 28,
                            selectedIndex: controller.selectedIndex,
                            index: index,
                            categoryName: "Nổi bật",
                            onTap: () {
                              controller.selectCategoryArticle(index: index);
                            },
                          );
                        } else {
                          final category =
                              controller.listCategoriesArticle[index - 1];
                          return ItemCategories(
                            radius: 28,
                            selectedIndex: controller.selectedIndex,
                            index: index,
                            categoryName: category.name,
                            onTap: () {
                              controller.selectCategoryArticle(
                                  index: index, categoryArticleId: category.id);
                            },
                          );
                        }
                      });
                    },
                  );
                }),
              ),
            ),
            SizedBox(height: 12),
            Obx(() {
              if (controller.listArticle.isEmpty) {
                return Center(
                  child: Text('Không có bài viết nào'),
                );
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: controller.listArticle.length,
                    itemBuilder: (context, index) {
                      final articles = controller.listArticle[index];
                      return ItemArticle(
                        widthImg: Get.width * 0.4,
                        heightImg: Get.height * 0.14,
                        path: Utils.I.getImageFullPath(articles.image ?? ''),
                        titleNews: articles.title.orDash,
                        titleStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                        description: articles.metaDescription.orDash,
                      );
                    }),
              );
            }),
          ],
        ),
      )),
    );
  }
}
