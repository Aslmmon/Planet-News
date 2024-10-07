import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/CustomError.dart';
import 'package:news_app/components/MainLayout.dart';
import 'package:news_app/components/SourceItemWidget.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/ui/Providers.dart';
import 'package:news_app/ui/newsSource/NewsSourcesProviders.dart';

class Newssourcesscreen extends ConsumerWidget {
  Newssourcesscreen({super.key, required this.onNextClick});

  static const SourcesScreenTag = '/sources';
  VoidCallback onNextClick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final sources = ref.watch(sourcesProvider(user));
    final myList = ref.watch(listProvider);

    return sources.when(
      data: (data) => Mainlayout(
          AppBarTitle: 'Choose your News Sources',
          MiddleScene: GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(5),
            // childAspectRatio: (1 / .7),
            children: List.generate(data.results.length, (index) {
              return SourceItemWidget(
                data.results[index],
                isSelected: myList.contains(index),
                indexItem: index,
              );
            }),
          ),
          onNextClicked: onNextClick),
      error: (error, stackTrace) => CustomError(errorDetails: error.toString()),
      loading: () => const Apploader(),
    );
  }
}
