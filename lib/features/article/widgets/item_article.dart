import 'package:flutter/material.dart';
import 'package:project_shop/widgets/image_base/base_image_widget.dart';

class ItemArticle extends StatelessWidget {
  const ItemArticle({
    super.key,
    this.titleNews,
    this.description,
    this.path,
    this.heightImg,
    this.widthImg,
    this.titleStyle,
    this.descriptionStyle,
    this.onTap,
    this.radius = 0,
  });

  final String? titleNews;
  final String? description;
  final String? path;
  final double? heightImg, widthImg;
  final TextStyle? titleStyle, descriptionStyle;
  final VoidCallback? onTap;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleNews ?? 'Title newspaper',
              style: titleStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseImageWidget(
                  radius: radius,
                  path: path ?? 'assets/images/avatar.png',
                  heightImage: heightImg,
                  widthImage: widthImg,
                ),
                SizedBox(width: 12),
                Flexible(
                  child: Text(
                    description ?? 'Description newspaper',
                    style: descriptionStyle,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
