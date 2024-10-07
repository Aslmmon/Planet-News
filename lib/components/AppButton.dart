import 'package:flutter/material.dart';

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
          color: Colors.black,
          thickness: 0.1,
          indent: 0,
          height: 0,
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

class FavouriteButton extends StatelessWidget {
  FavouriteButton(
      {super.key,
      required this.titleButton,
      this.padding = EdgeInsets.zero,
      this.ButtonColor = AppBlueColor,
      required this.isButtonDisabled,
      required this.onPressed,
      required this.isLoading});

  final String titleButton;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  Color? ButtonColor;

  final bool isButtonDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: ButtonColor,
          ),
          child: isLoading
              ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                      strokeWidth: 3, color: Colors.red),
                )
              : Text(
                  titleButton,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                )),
    );
  }
}

const AppBlueColor =
    Color(0xff1877F2); // Second `const` is optional in assignments.
