import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/country/Country.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchUserController, List>((ref) {
  return SearchUserController();
});

class SearchUserController extends StateNotifier<List> {
  SearchUserController() : super([]);

  void onSearchUser(String query, List<Country> data) {
    state = [];
    if (query.isNotEmpty) {
      final result = data
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(query.toString().toLowerCase()))
          .toSet()
          .toList();
      state.addAll(result);
    }
  }
}
