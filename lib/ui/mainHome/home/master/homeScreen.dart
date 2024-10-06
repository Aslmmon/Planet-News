import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/components/Apploader.dart';
import 'package:news_app/components/ArticlesList.dart';
import 'package:news_app/components/CountryChooserWidget.dart';
import 'package:news_app/components/CustomError.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/providers.dart';
import 'package:news_app/ui/Providers.dart';
import 'package:news_app/ui/mainHome/home/components/BuildHorizontalList.dart';
import 'package:news_app/utils/AdHelper.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen(this.onArticleClicked, {super.key});

  final ValueChanged<ArticleItem> onArticleClicked;

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  BannerAd? _bannerAd;
  final PagingController<int, ArticleItem> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _initializeAds();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('again');
  }

  @override
  Widget build(BuildContext context) {
    final topicsPrv = ref.watch(topicsProvider);
    final user = ref.watch(userProvider);

    // final userFromShared = json.decode(ref.watch(sharedPrefProvider).getString('user') ?? '') as User;
    //  final articles = ref.watch(articlesProvider((user: user, pageKey: 0)));

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
                    ref.read(userProvider.notifier).updateUser(newUSer, ref);
                    print(newUSer);
                    _pagingController.refresh();

                      }),
                ),
                Expanded(
                    child: BuildArticleList(_pagingController,
                        onArticleClicked: (article) =>
                            widget.onArticleClicked(article))),
              ],
            ),
        error: (error, _) => CustomError(errorDetails: error.toString()),
        loading: () => const Apploader());
  }

  void _initializeAds() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  Future<void> _fetchPage(int pageKey) async {
    final user = ref.watch(userProvider);
    try {
      final newData = await ref
          .read(apiDataProviderForArticles((user: user, pageKey: pageKey)));
      print('result of list ${newData.results.length.toString()}');
      print(
          'total pages list  ${_pagingController.itemList?.length.toString()}');

      final isLastPage = newData.results.length < 10;
      //final isLastPage = _pagingController.itemList!.length >= newData.totalResults;
      print('is Last Page ${isLastPage.toString()}');

      if (isLastPage) {
        _pagingController.appendLastPage(newData.results);
      } else {
        final nextPageKey = newData.nextPage;
        _pagingController.appendPage(newData.results, int.parse(nextPageKey ?? '0'));
      }
    } catch (error) {
      print('error is  ${error.toString()}');

      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

//** banner widget :
// if (_bannerAd != null)
//   Column(
//     children: [
//       const SizedBox(height: 10),
//       Align(
//         alignment: Alignment.topCenter,
//         child: SizedBox(
//           width: _bannerAd!.size.width.toDouble(),
//           height: _bannerAd!.size.height.toDouble(),
//           child: AdWidget(ad: _bannerAd!),
//         ),
//       ),
//     ],
//   ),
