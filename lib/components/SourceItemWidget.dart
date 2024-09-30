import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/sources/Sources.dart';
import 'package:news_app/ui/newsSource/NewsSourcesProviders.dart';
import 'TopicsItem.dart';

const imageLink =
    'https://cdn.vectorstock.com/i/1000x1000/82/09/avatar-journalist-cartoon-vector-10578209.webp';

class SourceItemWidget extends ConsumerWidget {
  const SourceItemWidget(
    this.sourceItem, {
    super.key,
    required this.isSelected,
    required this.indexItem,
  });

  final SourceItem sourceItem;
  final bool isSelected;
  final int indexItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(isSelected.toString());
    return Column(
      children: [
        CircleAvatar(
          radius: 18,
          child: ClipOval(
            child: Image.network(sourceItem.icon ?? imageLink),
          ),
        ),
        Text(
          sourceItem.name ?? '',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        InkWell(
            onTap: () {
              isSelected
                  ? ref.read(listProvider.notifier).removeItem(indexItem)
                  : ref.read(listProvider.notifier).addItem(indexItem);
            },
            child: BorderdContainer(
                isSelectedTopic: isSelected,
                topicName: isSelected ? 'UnFollow' : 'Follow'))
      ],
    );
  }
}
