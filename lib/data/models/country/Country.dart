import 'package:json_annotation/json_annotation.dart';

part 'Country.g.dart';

@JsonSerializable()
class Country {
  String name;
  String code;
  String emoji;
  String unicode;
  String image;

  Country(
      {required this.name,
      required this.code,
      required this.emoji,
      required this.unicode,
      required this.image});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
