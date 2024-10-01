import 'package:json_annotation/json_annotation.dart';

part 'Country.g.dart';

@JsonSerializable()
class Country {
  String? name = 'egypt';
  String? code='eg';
  String? emoji='🇪🇬';
  String? unicode ='U+1F1EA U+1F1EC';
  String? image = 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/EG.svg';

  Country({this.name, this.code, this.emoji, this.unicode, this.image});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
