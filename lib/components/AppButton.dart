import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/network/chopper/ApiService.dart';
import 'package:news_app/ui/Providers.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      required this.titleButton,
      this.padding = EdgeInsets.zero,
      this.ButtonColor = AppBlueColor,
      required this.isButtonDisabled,
      required this.onPressed});

  final String titleButton;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  Color? ButtonColor;

 final bool isButtonDisabled;

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: ButtonColor,
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
