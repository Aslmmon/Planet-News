import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/ArticleItemWidget.dart';
import 'package:news_app/components/LatestTopicItem.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BuildHorizontalList extends ConsumerWidget {

  const BuildHorizontalList(
    this.data, {
    super.key,
  });

  final List<Topics> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemScrollController itemScrollController = ItemScrollController();
    final user = ref.read(userProvider);



    print(user.topic);
    return ScrollablePositionedList.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemScrollController: itemScrollController,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: LatestTopicItem(
              data: data[index],
              isSelected: data[index].name?.compareTo(user.topic) == 0,
            ),
          );
        });
  }
}

class BuildVerticalList extends StatelessWidget {
  const BuildVerticalList(
    this.data, {
    super.key,
  });

  final List<ArticleItem> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ArticleItemWidget(data: data[index]),
          );
        });
  }
}
