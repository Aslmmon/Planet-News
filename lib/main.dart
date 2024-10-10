import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:news_app/components/CustomError.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/data/network/chopper/ApiService.dart';
import 'package:news_app/navigation/AppNavigation.dart';
import 'package:news_app/ui/theme/theme.dart';
import 'package:news_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleItemAdapter());
  await Hive.openBox<ArticleItem>(articlesDatabase);

  final sharedPrefs = await SharedPreferences.getInstance();
  final service = ApiService.create();
  _setupLogging();

  runApp(ProviderScope(overrides: [
    sharedPrefProvider.overrideWithValue(sharedPrefs),
    serviceProvider.overrideWithValue(service)
  ], child: const NewsApp()));

}

class NewsApp extends ConsumerWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp.router(
        theme: theme,
        themeMode: ThemeMode.dark,
        routerConfig: AppNavigation.appRouter,
        builder: (BuildContext context, Widget? widget) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomError(errorDetails: errorDetails.summary.toString());
          };
          return widget!;
        });
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
