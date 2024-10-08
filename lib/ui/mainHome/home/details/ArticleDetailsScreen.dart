import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/components/SourceItemWidget.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/ui/mainHome/bookmarks/BookmarkStateNotifier.dart';
import 'package:news_app/utils/AdHelper.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends ConsumerStatefulWidget {
  static const ArticleDetailsTag = '/articles';

  const ArticleDetailsScreen({required this.articleItem});

  final ArticleItem articleItem;

  @override
  ConsumerState<ArticleDetailsScreen> createState() =>
      _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends ConsumerState<ArticleDetailsScreen> {
  BannerAd? _bannerAd;
  late Uri _url;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _initializeAds();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.articleItem.toString());
    return DraggableScrollableSheet(
      initialChildSize: 1, // half screen on load
      maxChildSize: 1, // full screen on scroll
      minChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) =>
          SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //** banner widget :
            if (_bannerAd != null)
              Column(
                children: [
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            CachedNetworkImage(
              imageUrl: widget.articleItem.image_url ?? imageLink,
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.articleItem.title ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                widget.articleItem.description ?? '',
                maxLines: 10,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: AppButton(
                isButtonDisabled: false,
                titleButton: 'Read Full Article on Media ',
                onPressed: () {
                  _url = Uri.parse(widget.articleItem.link ?? '');
                  _launchUrl();
                },
                ButtonColor: Colors.blue.withOpacity(0.7),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: FavouriteButton(
                isLoading: _isLoading,
                isButtonDisabled: false,
                titleButton: 'Add to favourites ❤️ ',
                onPressed: () => _saveArticleToDB(),
                ButtonColor: Colors.red.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _saveArticleToDB() {
    return setState(() {
      _isLoading = true;
      ref
          .read(bookmarkStateNotifieer.notifier)
          .addArticleItem(widget.articleItem);
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
}
