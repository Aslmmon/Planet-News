import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/ui/countryChooser/CountryChooserScreen.dart';
import 'package:news_app/ui/mainHome/MainHome.dart';
import 'package:news_app/ui/mainHome/home/details/ArticleDetailsScreen.dart';
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
            onSplashFinished: (isOnBoardingDone) {
              if (isOnBoardingDone == true) {
                //context.go(Mainhome.MainHomeTag);
                context.go(CountryChooserScreen.CountryChooserScreenTag);
              } else {
                context.go(CountryChooserScreen.CountryChooserScreenTag);
              }
            },
          );
        },
      ),
      GoRoute(
          path: CountryChooserScreen.CountryChooserScreenTag,
          builder: (BuildContext context, GoRouterState state) {
            return CountryChooserScreen(() {
              context.push(Topicsscreen.TopicsScreenTag);
            });
          }),
      GoRoute(
          path: Topicsscreen.TopicsScreenTag,
          builder: (BuildContext context, GoRouterState state) {
            return Topicsscreen(
              onNextClicked: () {
                context.push(Mainhome.MainHomeTag);
              },
            );
          }),
      GoRoute(
          path: Mainhome.MainHomeTag,
          builder: (BuildContext context, GoRouterState state) {
            return Mainhome((article) {
              print(article.description.toString());
              context.pushNamed(ArticleDetailsScreen.ArticleDetailsTag,
                  extra: article);
            });
          }),

      /**
       * Not used in Navigation Stack , just there to put implementation of sending data from One Route to another . :)
       */
      GoRoute(
          path: ArticleDetailsScreen.ArticleDetailsTag,
          name: ArticleDetailsScreen.ArticleDetailsTag,
          builder: (BuildContext context, GoRouterState state) {
            ArticleItem articleItem =
                state.extra as ArticleItem; // -> casting is important
            return ArticleDetailsScreen(articleItem: articleItem);
          }),
    ],
  );
}