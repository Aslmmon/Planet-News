import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/network/chopper/ApiService.dart';

import '../data/models/country/Country.dart';

class CountryItem extends ConsumerWidget {
  const CountryItem(
      {super.key,
      required this.country,
      required this.isSelected,
      required this.indexItem});

  final Country country;
  final bool isSelected;
  final int indexItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(2),
      highlightColor: AppBlueColor,
      splashColor: Colors.blue.withOpacity(0.1),
      onTap: () {
        ref.read(IndexProvider.notifier).state = indexItem;
      },
      child: Container(

        padding: const EdgeInsets.all(8.0),
        color: isSelected ? AppBlueColor.withOpacity(0.8) : Colors.white,
        child: Row(
          children: [
            Text(
              country.emoji,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(width: 10),
            Text(country.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: isSelected ? Colors.white : Colors.black)),
            isSelected
                ? const Expanded(
                    child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
