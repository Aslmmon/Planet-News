import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';

class Mainlayout extends StatelessWidget {
  const Mainlayout(
      {super.key,
      required this.AppBarTitle,
      required this.MiddleScene,
      required this.onNextClicked});

  final String AppBarTitle;
  final Widget MiddleScene;
  final VoidCallback onNextClicked;

  @override
  Widget build(BuildContext context) {
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
                titleButton: 'Next',
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                onPressed: onNextClicked,
              )
            ]));
  }
}
