import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';

class Mainlayout extends StatelessWidget {
  Mainlayout(
      {super.key,
      required this.AppBarTitle,
      required this.MiddleScene,
      required this.onNextClicked});

  String AppBarTitle;
  Widget MiddleScene;
  VoidCallback onNextClicked;

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
              SizedBox(
                  height: MediaQuery.of(context).size.height * 3 / 4,
                  child: MiddleScene),
              AppButton(
                titleButton: 'Next',
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                onPressed: onNextClicked,
              )
            ]));
  }
}
