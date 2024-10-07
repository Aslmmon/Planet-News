import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/data/network/service_interface.dart';

part 'ApiService.chopper.dart';

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
  @Get(path: "/api/1/latest")
  Future<Response> fetchLatestArticles(@Query("apiKey") String api,
      @Query("country") String country, @Query('category') String category);

  @override
  @Get(path: "/api/1/latest")
  Future<Response> fetchLatestArticlesWithNextPage(
      @Query("apiKey") String api,
      @Query("country") String country,
      @Query('category') String category,
      @Query('page') String page);

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
