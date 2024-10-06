import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const ArticleDetailsTag = '/articles';

   ArticleDetailsScreen({required this.articleItem});

  final ArticleItem articleItem;
  late Uri _url;

  @override
  Widget build(BuildContext context) {
    print(articleItem.toString());
    return DraggableScrollableSheet(
      initialChildSize: 1, // half screen on load
      maxChildSize: 1, // full screen on scroll
      minChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(articleItem.image_url ?? ''),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articleItem.title ?? '',
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                articleItem.description ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                isButtonDisabled: false,
                titleButton: 'Read Article on Media ',
                onPressed: () {
                  _url =Uri.parse(articleItem.link ?? '');
                  _launchUrl();
                },
                ButtonColor: Colors.blue.withOpacity(0.7),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}


