import 'package:flutter/material.dart';
import 'package:news_app/components/SourceItemWidget.dart';
import 'package:news_app/data/models/articles/Articles.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({
    super.key,
    required this.data,
  });

  final ArticleItem data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Image.network(data.image_url ?? imageLink,
              fit: BoxFit.cover,
              width: 100,
              height: 100, errorBuilder: (BuildContext context,
                  Object exception, StackTrace? stackTrace) {
            return Image.network(imageLink, width: 100, height: 100);
          }),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.source_name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                data.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.network(
                    data.source_icon ?? imageLink,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    data.source_name ?? '',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 10),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    data.pubDate ?? '',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 8),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
