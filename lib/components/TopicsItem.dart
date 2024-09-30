import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/network/chopper/ApiService.dart';

import 'AppButton.dart';

class TopicsItem extends ConsumerWidget {
  const TopicsItem({
    super.key,
    required this.topicName,
    required this.IndexItem,
    required this.isSelectedTopic,
  });

  final String topicName;
  final int IndexItem;
  final bool isSelectedTopic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(IndexProvider.notifier).state = IndexItem;
      },
      child: BorderdContainer(
          isSelectedTopic: isSelectedTopic, topicName: topicName),
    );
  }
}

class BorderdContainer extends StatelessWidget {
  const BorderdContainer({
    super.key,
    required this.isSelectedTopic,
    required this.topicName,
  });

  final bool isSelectedTopic;
  final String topicName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelectedTopic ? AppBlueColor : Colors.white,
        border: Border.all(width: 0.4, color: AppBlueColor),
        borderRadius: const BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Center(
          child: Text(
        topicName,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: isSelectedTopic ? Colors.white : AppBlueColor),
      )),
    );
  }
}
