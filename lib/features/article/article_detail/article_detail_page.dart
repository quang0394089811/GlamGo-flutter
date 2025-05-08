import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail Page'),
      ),
      body: const Center(
        child: Text('Article Detail Page Content'),
      ),
    ));
  }
}