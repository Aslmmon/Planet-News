import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/data/models/topics/Topics.dart';

class LatestTopicItem extends StatelessWidget {
  const LatestTopicItem({
    super.key,
    required this.data,
    required this.isSelected,
  });

  final Topics data;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: isSelected ? AppBlueColor : Colors.white10,
              border: Border.all(
                color: isSelected ? AppBlueColor : Colors.white10,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            data.name ?? '',
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        )
      ],
    );
  }
}
