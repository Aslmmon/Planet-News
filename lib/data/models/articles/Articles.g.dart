// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => ArticleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'results': instance.results,
    };

ArticleItem _$ArticleItemFromJson(Map<String, dynamic> json) => ArticleItem(
      article_id: json['article_id'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      pubDate: json['pubDate'] as String?,
      pubDateTZ: json['pubDateTZ'] as String?,
      source_name: json['source_name'] as String?,
      source_url: json['source_url'] as String?,
      source_icon: json['source_icon'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$ArticleItemToJson(ArticleItem instance) =>
    <String, dynamic>{
      'article_id': instance.article_id,
      'title': instance.title,
      'link': instance.link,
      'description': instance.description,
      'pubDate': instance.pubDate,
      'pubDateTZ': instance.pubDateTZ,
      'source_name': instance.source_name,
      'source_url': instance.source_url,
      'source_icon': instance.source_icon,
      'language': instance.language,
    };
