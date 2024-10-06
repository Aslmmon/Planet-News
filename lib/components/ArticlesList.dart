import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/components/ArticleItemWidget.dart';
import 'package:news_app/data/models/articles/Articles.dart';
class BuildArticleList extends ConsumerWidget {
  const BuildArticleList(
    this._pagingController, {
    super.key,
    required this.onArticleClicked,
  });

  final PagingController<int, ArticleItem> _pagingController;

  final ValueChanged<ArticleItem> onArticleClicked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PagedListView<int, ArticleItem>.separated(
      pagingController: _pagingController,
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate<ArticleItem>(
        itemBuilder: (context, item, index) => ArticleItemWidget(
          data: item,
          valueChanged: (article) {
            onArticleClicked(article);
          },
        ),
      ),
      separatorBuilder: (_, index) => const Divider(),
    );
  }
}
