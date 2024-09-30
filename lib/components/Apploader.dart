import 'package:flutter/material.dart';
import 'package:news_app/components/AppButton.dart';

class Apploader extends StatelessWidget {
  const Apploader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: AppBlueColor,
        ),
      ),
    );
  }
}
