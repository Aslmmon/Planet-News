// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String?,
      code: json['code'] as String?,
      emoji: json['emoji'] as String?,
      unicode: json['unicode'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'emoji': instance.emoji,
      'unicode': instance.unicode,
      'image': instance.image,
    };
