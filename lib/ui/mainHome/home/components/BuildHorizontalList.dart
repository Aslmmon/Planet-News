import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/ArticleItemWidget.dart';
import 'package:news_app/components/CustomError.dart';
import 'package:news_app/components/LatestTopicItem.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/ui/Providers.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BuildHorizontalList extends ConsumerStatefulWidget {
  BuildHorizontalList(
      this.data, this.user, this.IndexToJumpTo, this.onTopicClicked);

  final List<Topics> data;
  final User user;
  final int IndexToJumpTo;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ValueChanged<Topics> onTopicClicked;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildHorizontalList();
}

class _BuildHorizontalList extends ConsumerState<BuildHorizontalList> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.itemScrollController.scrollTo(
        index: widget.IndexToJumpTo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemScrollController: widget.itemScrollController,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: LatestTopicItem(
              data: widget.data[index],
              isSelected: widget.data[index].name
                      ?.compareTo(widget.user.topic.name ?? '') ==
                  0,
              onTopicClicked: widget.onTopicClicked,
            ),
          );
        });
  }
}

class BuildVerticalList extends ConsumerStatefulWidget {
  const BuildVerticalList({
    super.key,
    required this.onArticleClicked,
  });

  final ValueChanged<ArticleItem> onArticleClicked;

  @override
  ConsumerState<BuildVerticalList> createState() => _BuildVerticalListState();
}

class _BuildVerticalListState extends ConsumerState<BuildVerticalList> {
  final PagingController<int, ArticleItem> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final user = ref.read(userProvider);
    try {
      final newData = await ref
          .read(apiDataProviderForArticles((user: user, pageKey: pageKey)));
      //final isLastPage = newData.results.length < _pageSize;
      print('result of list ${newData.results.length.toString()}');
      print(
          'total pages list  ${_pagingController.itemList?.length.toString()}');

      final isLastPage = newData.totalResults <= newData.results.length;
      //final isLastPage = _pagingController.itemList!.length >= newData.totalResults;
      print('is Last Page ${isLastPage.toString()}');

      if (isLastPage) {
        _pagingController.appendLastPage(newData.results);
      } else {
        final nextPageKey = newData.nextPage;
        _pagingController.appendPage(newData.results, int.parse(nextPageKey));
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => _pagingController.refresh()),
      child: PagedListView<int, ArticleItem>.separated(
        pagingController: _pagingController,
        shrinkWrap: true,
        builderDelegate: PagedChildBuilderDelegate<ArticleItem>(
          itemBuilder: (context, item, index) => ArticleItemWidget(
            data: item,
            valueChanged: (article) {
              widget.onArticleClicked(article);
            },
          ),
        ),
        separatorBuilder: (_, index) => const Divider(),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
