// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Articles.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlesAdapter extends TypeAdapter<Articles> {
  @override
  final int typeId = 0;

  @override
  Articles read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Articles(
      status: fields[0] as String,
      totalResults: fields[1] as int,
      results: (fields[2] as List).cast<ArticleItem>(),
      nextPage: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Articles obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.results)
      ..writeByte(3)
      ..write(obj.nextPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticlesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ArticleItemAdapter extends TypeAdapter<ArticleItem> {
  @override
  final int typeId = 1;

  @override
  ArticleItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleItem(
      article_id: fields[0] as String?,
      title: fields[1] as String?,
      link: fields[2] as String?,
      description: fields[3] as String?,
      pubDate: fields[4] as String?,
      pubDateTZ: fields[5] as String?,
      image_url: fields[6] as String?,
      source_name: fields[7] as String?,
      source_url: fields[8] as String?,
      source_icon: fields[9] as String?,
      language: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleItem obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.article_id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.pubDate)
      ..writeByte(5)
      ..write(obj.pubDateTZ)
      ..writeByte(6)
      ..write(obj.image_url)
      ..writeByte(7)
      ..write(obj.source_name)
      ..writeByte(8)
      ..write(obj.source_url)
      ..writeByte(9)
      ..write(obj.source_icon)
      ..writeByte(10)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => ArticleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String?,
    );

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'results': instance.results,
      'nextPage': instance.nextPage,
    };

ArticleItem _$ArticleItemFromJson(Map<String, dynamic> json) => ArticleItem(
      article_id: json['article_id'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      pubDate: json['pubDate'] as String?,
      pubDateTZ: json['pubDateTZ'] as String?,
      image_url: json['image_url'] as String?,
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
      'image_url': instance.image_url,
      'source_name': instance.source_name,
      'source_url': instance.source_url,
      'source_icon': instance.source_icon,
      'language': instance.language,
    };
