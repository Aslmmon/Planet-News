import 'package:flutter/material.dart';
import 'package:news_app/data/models/topics/Topics.dart';

class LatestTopicItem extends StatelessWidget {
  const LatestTopicItem({
    super.key,
    required this.data,
  });

  final Topics data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data.name ?? '',
      style: const TextStyle(color: Colors.black),
    );
  }
}
