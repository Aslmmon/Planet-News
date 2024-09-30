import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/ui/countryChooser/CountryChooserScreen.dart';
import 'package:news_app/ui/mainHome/MainHome.dart';
import 'package:news_app/ui/newsSource/NewsSourcesScreen.dart';
import 'package:news_app/ui/splash/SplashScreen.dart';
import 'package:news_app/ui/topics/TopicsScreen.dart';

class AppNavigation {
  /// The route configuration.
  static final GoRouter appRouter = GoRouter(
    initialLocation: Splashscreen.SplashScreenTag,
    routes: <RouteBase>[
      GoRoute(
        path: Splashscreen.SplashScreenTag,
        builder: (BuildContext context, GoRouterState state) {
          return Splashscreen(
            onSplashFinished: () {
              Timer(const Duration(seconds: 3), () {
                context.go(Countrychooserscreen.CountryChooserScreenTag);
              });
            },
          );
        },
      ),
      GoRoute(
          path: Countrychooserscreen.CountryChooserScreenTag,
          builder: (BuildContext context, GoRouterState state) {
            return Countrychooserscreen(() {
              context.push(Topicsscreen.TopicsScreenTag);
            });
          }),
      GoRoute(
          path: Topicsscreen.TopicsScreenTag,
          builder: (BuildContext context, GoRouterState state) {
            return Topicsscreen(
              onNextClicked: () {
                context.push(Newssourcesscreen.SourcesScreenTag);
              },
            );
          }),
      GoRoute(
          path: Newssourcesscreen.SourcesScreenTag,
          builder: (BuildContext context, GoRouterState state) {
            return Newssourcesscreen(
              onNextClick: () {
                context.go(Mainhome.MainHomeTag);
              },
            );
          }),
      GoRoute(
          path: Mainhome.MainHomeTag,
          builder: (BuildContext context, GoRouterState state) {
            return const Mainhome();
          })
    ],
  );
}
