import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListNotifiers extends StateNotifier<List<int>> {
  ListNotifiers() : super([]);

  void removeItem(int item) {
    state = state.where((element) => element != item).toList();
  }

  void addItem(int item) {
    state = [...state, item];
  }
}

final listProvider =
    StateNotifierProvider.autoDispose<ListNotifiers, List<int>>(
  (ref) => ListNotifiers(),
);
