import 'package:json_annotation/json_annotation.dart';

part 'Articles.g.dart';

@JsonSerializable()
class Articles {
  String status;
  int totalResults;
  List<ArticleItem> results;

  Articles(
      {required this.status,
      required this.totalResults,
      required this.results});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

@JsonSerializable()
class ArticleItem {
  String? article_id;
  String? title;
  String? link;
  String? description;
  String? pubDate;
  String? pubDateTZ;
  String? source_name;
  String? source_url;
  String? source_icon;
  String? language;

  ArticleItem(
      {this.article_id,
      this.title,
      this.link,
      this.description,
      this.pubDate,
      this.pubDateTZ,
      this.source_name,
      this.source_url,
      this.source_icon,
      this.language});


  factory ArticleItem.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleItemToJson(this);
}
