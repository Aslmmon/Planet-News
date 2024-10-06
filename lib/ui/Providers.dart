import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/articles/Articles.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/sources/Sources.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:news_app/network/chopper/ApiService.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../providers.dart';

part 'Providers.g.dart';

typedef Parameters = ({User user, int pageKey});

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

@riverpod
Future<Articles> articles(ArticlesRef ref, Parameters parameter) =>
    ref.read(apiDataProviderForArticles(parameter));

// providers for Network

final apiDataProvider =
    Provider.autoDispose.family<Future<Sources>, User>((ref, data) async {
  final apiService = ref.read(serviceProvider);
  final response = await apiService.fetchData(
      apiKey, data.country.code?.toLowerCase() ?? '', data.topic.name ?? '');
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
    print(response.error.toString());
    throw Exception("Failed to fetch data due to ${response.error}");
  }
});

/// Methods to convert network Sources into Local Sources
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

final apiDataProviderForArticles = Provider.autoDispose
    .family<Future<Articles>, Parameters>((ref, parameters) async {
  final apiService = ref.read(serviceProvider);
  final response;
  if (parameters.pageKey == 0) {
    response = await apiService.fetchLatestArticles(
        apiKey,
        parameters.user.country.code?.toLowerCase() ?? '',
        parameters.user.topic.name ?? '');
  } else {
    response = await apiService.fetchLatestArticlesWithNextPage(
        apiKey,
        parameters.user.country.code?.toLowerCase() ?? '',
        parameters.user.topic.name ?? '',
        parameters.pageKey.toString());
  }
  if (response.isSuccessful) {
    final articlesModel = Articles.fromJson(response.body);

    final articlesList = getArticlesItems(articlesModel);
    final articlesResponse = Articles(
        status: articlesModel.status,
        results: articlesList,
        totalResults: articlesModel.totalResults,
        nextPage: articlesModel.nextPage);
    debugPrint( 'm here' +  articlesResponse.toString());

    return articlesResponse;
  } else {
    print(response.error.toString());
    throw Exception("Failed to fetch data ");
  }
});

/// Methods to convert network Articles into Local Articles
List<ArticleItem> getArticlesItems(Articles result) {
  final articles = <ArticleItem>[];
  for (final result in result.results) {
    articles.add(getArticleItem(result));
  }
  return articles;
}

ArticleItem getArticleItem(ArticleItem result) {
  return ArticleItem(
    article_id: result.article_id,
    title: result.title,
    link: result.link,
    description: result.description,
    image_url: result.image_url,
    pubDate: result.pubDate,
    pubDateTZ: result.pubDateTZ,
    source_name: result.source_name,
    source_url: result.source_url,
    source_icon: result.source_icon,
    language: result.language,
  );
}
