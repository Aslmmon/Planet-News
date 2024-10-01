import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User extends Equatable {
  final String country;
  final String topic;

  const User(this.country, this.topic);

  @override
  List<Object?> get props => [country, topic];

  User copyWith({
    String? country,
    String? topic,
  }) {
    return User(
      country = country ?? this.country,
      topic = topic ?? this.topic,
    );
  }
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(const User('eg', 'sports'));

  void updateUser(User updatedUser) {
    state = updatedUser;
    debugPrint('----- user now is $state----- ');
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());
