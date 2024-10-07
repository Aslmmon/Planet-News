import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/utils/constants.dart';

class Bookmarkscreen extends StatelessWidget {
  const Bookmarkscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: EmptyView(
          title: 'No Bookmarks Found',
        ),
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
