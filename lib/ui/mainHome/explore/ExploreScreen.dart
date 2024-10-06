import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/CountryChooserWidget.dart';
import 'package:news_app/components/SearchBox.dart';
import 'package:news_app/data/models/user/user.dart';

class Explorescreen extends ConsumerWidget {
  const Explorescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    TextEditingController searchController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CountryChooserWidget(
          user: user,
          onDisMiss: () => {},
        ),
        const SizedBox(height: 10),
        SearchBox(
            controller: searchController,
            onChanged: (query) {
              print(query);
            }),
        const Expanded(
          child: Center(child: Text('Enter Text to search items here ')),
        )
      ],
    );
  }
}
