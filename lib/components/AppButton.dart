import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/network/chopper/ApiService.dart';

class AppButton extends ConsumerWidget {
  AppButton(
      {super.key,
      required this.titleButton,
      this.padding = EdgeInsets.zero,
      required this.onPressed});

  String titleButton;
  EdgeInsets padding;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonDisabled = (ref.watch(IndexProvider) == -1);
    return Column(
      children: [
        const Divider(
          thickness: 0.3,
        ),
        Container(
            padding: padding,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: isButtonDisabled ? null : onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: AppBlueColor,
                ),
                child: Text(
                  titleButton,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ))),
      ],
    );
  }
}

const AppBlueColor =
    Color(0xff1877F2); // Second `const` is optional in assignments.
