import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/utils/constants.dart';

import 'BookmarkStateNotifier.dart';

class Bookmarkscreen extends ConsumerWidget {
  const Bookmarkscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarkStateNotifieer);
    debugPrint('bookmarks list are ' + bookmarks!.length.toString());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Bookmarks',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: bookmarks.isEmpty
          ? const Center(
              child: EmptyView(
                title: 'No Bookmarks Found',
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) => Text(bookmarks[index].title.toString()),
              itemCount: bookmarks.length,
            ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: OverflowBox(
            minHeight: 400,
            maxHeight: 400,
            child: Lottie.asset(empty),
          ),
        ),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
