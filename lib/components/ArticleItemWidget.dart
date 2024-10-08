import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/SourceItemWidget.dart';
import 'package:news_app/data/models/articles/Articles.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({
    super.key,
    required this.data,
    required this.valueChanged,
  });

  final ArticleItem data;
  final ValueChanged<ArticleItem> valueChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        valueChanged(data);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: CachedNetworkImage(
              width: 100,
              height: 100,
              placeholder: (context, url) => const Apploader(),
              imageUrl: data.image_url ?? imageLink,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outlined, color: Colors.red),
            ),
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
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Text(
                  data.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          NetworkImage(data.source_icon ?? imageLink),
                      radius: 10,
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text (
                        data.source_name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 10),
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time_outlined, size: 14),
                    const SizedBox(width: 10),
                    Text(
                      data.pubDate ?? '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey,
                          fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
