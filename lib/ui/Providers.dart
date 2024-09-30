
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/sources/Sources.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/network/chopper/ApiService.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../providers.dart';
part 'Providers.g.dart';


// providers for UI :



@riverpod
Future<List<Country>> countries(CountriesRef ref) =>
    ref.read(serviceProvider).getCountries();



final IndexProvider = StateProvider.autoDispose((ref) {
  return -1;
});

@riverpod
Future<List<Topics>> topics(TopicsRef ref) =>
    ref.read(serviceProvider).getTopics();

@riverpod
Future<Sources> sources(SourcesRef ref, User user) =>
    ref.read(apiDataProvider(user));