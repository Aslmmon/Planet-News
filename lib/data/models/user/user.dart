import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/providers.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final Country country;
  final Topics topic;

  const User(this.country, this.topic);

  @override
  List<Object?> get props => [country, topic];

  User copyWith({
    Country? country,
    Topics? topic,
  }) {
    return User(
      country = country ?? this.country,
      topic = topic ?? this.topic,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(User(
            Country(
                name: 'egypt',
                code: 'eg',
                emoji: '🇪🇬',
                unicode: 'U+1F1EA U+1F1EC',
                image:
                    'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/EG.svg'),
            Topics(name: 'sports', id: '1')));

  void updateUser(User updatedUser, WidgetRef? ref) {
    state = updatedUser;
    ref?.read(sharedPrefProvider).setString('user', jsonEncode(state));
    debugPrint('----- user country now is ${state.country.name}----- ');
    debugPrint('----- user topic now is ${state.topic.name}----- ');
  }

  User getUser() {
    return state;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});
