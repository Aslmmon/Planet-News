import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles/Articles.dart';

class BuildBookmarkedItem extends StatelessWidget {
  const BuildBookmarkedItem({
    super.key,
    required this.bookmarks,
  });

  final List<ArticleItem>? bookmarks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          Stack(alignment: Alignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              height: 150,
              fit: BoxFit.contain,
              imageUrl: bookmarks?[index].image_url ?? '',
              imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor.withOpacity(0.2),
                              BlendMode.multiply)),
                    ),
                  )),
        ),
        ColoredBox(color: Colors.black.withOpacity(0.5) // 0: Light, 1: Dark
            ),
        Center(
            child: Text(
          bookmarks?[index].title ?? '',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ))
      ]),
      itemCount: bookmarks!.length,
      separatorBuilder: (context, _) => const Divider(
        thickness: 1,
      ),
    );
  }
}
