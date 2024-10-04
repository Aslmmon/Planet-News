import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/providers.dart';
import 'package:news_app/utils/constants.dart';

class Splashscreen extends ConsumerStatefulWidget {
  static const SplashScreenTag = '/';

  final ValueChanged<bool?> onSplashFinished;

  const Splashscreen({super.key, required this.onSplashFinished});

  @override
  ConsumerState<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends ConsumerState<Splashscreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      final isOnBoardingDone =
          ref.read(sharedPrefProvider).getBool(OnBoardingDone);
      widget.onSplashFinished(isOnBoardingDone);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/splash_logo.json', width: 200, height: 150),
            Text('Your Daily Dose of News',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
