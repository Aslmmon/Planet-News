import 'package:json_annotation/json_annotation.dart';

part 'Sources.g.dart';

@JsonSerializable()
class Sources {
  String status;
  int totalResults;
  List<SourceItem> results;

  Sources(
      {required this.status,
      required this.totalResults,
      required this.results});

  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesToJson(this);
}

@JsonSerializable()
class SourceItem {
  String? id;
  String? name;
  String? url;
  String? icon;
  String? description;
  String? last_fetch;

  SourceItem({
    required this.id,
    required this.name,
    required this.url,
    required this.icon,
    required this.description,
    required this.last_fetch,
  });

  factory SourceItem.fromJson(Map<String, dynamic> json) =>
      _$SourceItemFromJson(json);

  Map<String, dynamic> toJson() => _$SourceItemToJson(this);
}
