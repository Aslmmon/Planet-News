// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sources _$SourcesFromJson(Map<String, dynamic> json) => Sources(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => SourceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'results': instance.results,
    };

SourceItem _$SourceItemFromJson(Map<String, dynamic> json) => SourceItem(
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      icon: json['icon'] as String?,
      description: json['description'] as String?,
      last_fetch: json['last_fetch'] as String?,
    );

Map<String, dynamic> _$SourceItemToJson(SourceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'icon': instance.icon,
      'description': instance.description,
      'last_fetch': instance.last_fetch,
    };
