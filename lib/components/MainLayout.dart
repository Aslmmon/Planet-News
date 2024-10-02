import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/ui/Providers.dart';

class Mainlayout extends ConsumerWidget {
  const Mainlayout(
      {super.key,
      required this.AppBarTitle,
      required this.MiddleScene,
      required this.onNextClicked});

  final String AppBarTitle;
  final Widget MiddleScene;
  final VoidCallback onNextClicked;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              AppBarTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: MiddleScene),
              AppButton(
                isButtonDisabled: (ref.watch(IndexProvider) == -1),
                titleButton: 'Next',
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                onPressed: onNextClicked,
              )
            ]));
  }
}
