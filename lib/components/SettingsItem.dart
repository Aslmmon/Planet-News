import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.startIcon,
      required this.title,
      required this.endWidget});

  final Icon startIcon;
  final String title;
  final Widget endWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            startIcon,
            const SizedBox(width: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: endWidget,
              ),
            ),
          ]),
    );
  }
}
