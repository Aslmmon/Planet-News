import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/sources/Sources.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/network/service_interface.dart';
import 'package:news_app/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ApiService.chopper.dart';

part 'ApiService.g.dart';

const apiKey = "pub_548991479c93c011bcbb3e55107110a45166d";

@ChopperApi(baseUrl: "https://newsdata.io")
abstract class ApiService extends ChopperService implements ServiceInterface {
  static ApiService create() {
    // 1
    final client = ChopperClient(
        interceptors: [HttpLoggingInterceptor()],
        errorConverter: const JsonConverter(),
        converter: const JsonConverter());
    // 7
    return _$ApiService(client);
  }

  @override
  @Get(path: "/api/1/sources")
  Future<Response> fetchData(@Query("apiKey") String endpoint,
      @Query('country') String country, @Query('category') String language);

  @override
  Future<List<Country>> getCountries() async {
    final countries = <Country>[];
    final jsonString = await rootBundle.loadString('assets/countries.json');
    final countriesList = jsonDecode(jsonString) as List;

    for (final result in countriesList) {
      countries.add(Country.fromJson(result));
    }
    await Future.delayed(const Duration(seconds: 1), () => {print('delayed')});

    return countries;
  }

  @override
  Future<List<Topics>> getTopics() async {
    var topics = <Topics>[];
    final jsonString = await rootBundle.loadString('assets/topics.json');
    final topicsList = jsonDecode(jsonString) as List;
    for (final result in topicsList) {
      topics.add(Topics.fromJson(result));
    }
    await Future.delayed(const Duration(seconds: 1), () => {print('delayed')});

    return topics;
  }
}

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

final apiDataProvider =
    Provider.autoDispose.family<Future<Sources>, User>((ref, data) async {
  final apiService = ref.read(serviceProvider);
  final response = await apiService.fetchData(apiKey, data.country, data.topic);
  print(response.isSuccessful.toString());

  if (response.isSuccessful) {
    final sourcesModel = Sources.fromJson(response.body);
    print(response.body);

    final sourcesList = getSourceItems(sourcesModel);
    final SourceResponse = Sources(
        status: sourcesModel.status,
        results: sourcesList,
        totalResults: sourcesModel.totalResults);
    debugPrint(SourceResponse.toString());

    return SourceResponse;
  } else {


    // Handle error
    print(response.error.toString());

    throw Exception("Failed to fetch data ");
  }
});

/// Methods to convert network recipes into local recipes
List<SourceItem> getSourceItems(Sources result) {
  final sources = <SourceItem>[];
  for (final result in result.results) {
    sources.add(getSItem(result));
  }
  return sources;
}

SourceItem getSItem(SourceItem result) {
  return SourceItem(
      id: result.id,
      name: result.name,
      url: result.url,
      icon: result.icon,
      last_fetch: result.last_fetch,
      description: result.description);
}
