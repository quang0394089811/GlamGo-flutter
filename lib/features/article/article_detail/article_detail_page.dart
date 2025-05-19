import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:project_shop/data/response_models/article/article_model.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ArticleModel articles = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            articles.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Html(
            data: articles.content,
          ),
        ),
      ),
    );
  }
}
