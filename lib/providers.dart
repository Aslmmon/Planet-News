import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/network/service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final serviceProvider = Provider<ServiceInterface>((ref) {
  throw UnimplementedError();
});
