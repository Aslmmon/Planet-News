import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/MainLayout.dart';
import 'package:news_app/components/TopicsItem.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/network/chopper/ApiService.dart';
import 'package:news_app/providers.dart';
import 'package:news_app/ui/Providers.dart';
import 'package:news_app/utils/constants.dart';

class Topicsscreen extends ConsumerWidget {
  static const TopicsScreenTag = '/topics';
  final VoidCallback onNextClicked;

  const Topicsscreen({super.key, required this.onNextClicked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsPrv = ref.watch(topicsProvider);
    final user = ref.watch(userProvider);

    return topicsPrv.when(
        data: (data) => Mainlayout(
              onNextClicked: () async {
                _updateTopic(user, data, ref);
                await _saveDoneOnBoarding(ref);
                onNextClicked();
              },
              AppBarTitle: 'Choose your Topic',
              MiddleScene: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (1 / .6),
                children: List.generate(data.length, (index) {
                  return TopicsItem(
                    topicName: (data[index].name ?? ''),
                    IndexItem: index,
                    isSelectedTopic: index == ref.watch(IndexProvider),
                  );
                }),
              ),
            ),
        error: (error, e) => Text(e.toString()),
        loading: () => const Apploader());
  }

  void _updateTopic(User user, List<Topics> data, WidgetRef ref) {
    User updatedUser =
        user.copyWith(topic: data[ref.read(IndexProvider.notifier).state]);
    ref.read(userProvider.notifier).updateUser(updatedUser);
  }

  Future<bool> _saveDoneOnBoarding(WidgetRef ref) async {
    return ref.read(sharedPrefProvider).setBool(OnBoardingDone, true);
  }
}
