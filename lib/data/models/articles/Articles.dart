import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Articles.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Articles {
  @HiveField(0)
  String status;
  @HiveField(1)
  int totalResults;
  @HiveField(2)
  List<ArticleItem> results;
  @HiveField(3)
  String? nextPage;

  Articles(
      {required this.status,
      required this.totalResults,
      required this.results,
      required this.nextPage});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 1)
class ArticleItem {
  @HiveField(0)
  String? article_id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? link;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? pubDate;
  @HiveField(5)
  String? pubDateTZ;
  @HiveField(6)
  String? image_url;
  @HiveField(7)
  String? source_name;
  @HiveField(8)
  String? source_url;
  @HiveField(9)
  String? source_icon;
  @HiveField(10)
  String? language;

  ArticleItem(
      {this.article_id,
      this.title,
      this.link,
      this.description,
      this.pubDate,
      this.pubDateTZ,
      this.image_url,
      this.source_name,
      this.source_url,
      this.source_icon,
      this.language});

  factory ArticleItem.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleItemToJson(this);

  @override
  String toString() {
    return "article :\n ${article_id} \n ${title} \n   ${link}  \n ${description}";
  }
}
