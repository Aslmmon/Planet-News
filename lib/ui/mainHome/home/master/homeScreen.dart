import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/CountryChooserWidget.dart';
import 'package:news_app/components/CustomError.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/ui/Providers.dart';
import 'package:news_app/ui/mainHome/home/components/BuildHorizontalList.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen(this.onArticleClicked, {super.key});

  final ValueChanged<ArticleItem> onArticleClicked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsPrv = ref.watch(topicsProvider);
    final user = ref.watch(userProvider);
    final articles = ref.watch(articlesProvider(user));
    print(user.country.toString());

    return topicsPrv.when(
        data: (data) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CountryChooserWidget(user: user),
                const SizedBox(height: 10),
                Text('Latest',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                    height: 40,
                    child: BuildHorizontalList(
                        data,
                        user,
                        data.indexWhere((topic) =>
                            topic.name?.compareTo(user.topic.name ?? '') == 0),
                        (topic) {
                      User newUSer = user.copyWith(topic: topic);
                      ref.read(userProvider.notifier).updateUser(newUSer);
                      print(newUSer);
                    })),
                Expanded(
                    child: articles.when(
                        data: (data) => BuildVerticalList(
                              data.results,
                              onArticleClicked: (ArticleItem value) {
                                onArticleClicked(value);
                              },
                            ),
                        error: (err, _) =>
                            CustomError(errorDetails: err.toString()),
                        loading: () => const Apploader()))
              ],
            ),
        error: (error, _) => CustomError(errorDetails: error.toString()),
        loading: () => const Apploader());
  }
}
