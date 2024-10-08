import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/data/models/topics/Topics.dart';

class LatestTopicItem extends StatelessWidget {
  const LatestTopicItem(
      {super.key,
      required this.data,
      required this.isSelected,
      required this.onTopicClicked});

  final Topics data;
  final bool isSelected;
  final ValueChanged<Topics> onTopicClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            onTopicClicked(data);
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).hintColor
                    : Theme.of(context).primaryColorLight,
                border: Border.all(
                  color:
                      isSelected ? Theme.of(context).hintColor : Colors.white10,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Text(
                data.name ?? '',
                style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).hintColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
