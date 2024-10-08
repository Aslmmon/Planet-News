import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/cache/ArticleRepo.dart';
import 'package:news_app/data/models/articles/Articles.dart';

class BookmarkStateNotifier extends StateNotifier<List<ArticleItem>?> {
  BookmarkStateNotifier(this.ref) : super(null) {
    /// Repository Todo Service Provider
    repo = ref.read(articleCacheRepositoryProvider);
    fetchTodo();
  }

  late ArticleRepo? repo;
  final StateNotifierProviderRef ref;

  ///fetch all todo from to local Storage

  void fetchTodo() {
    state = repo?.getArticlesItem();
  }

  ///add todo to local Storage

  void addArticleItem(ArticleItem articleItem) {
    if (state?.contains(articleItem) == true) {
      return;
    } else {
      state = repo?.addArticleItem(articleItem);
    }
  }

  ///remove todo from local Storage
  void removeArticleItem(String id) {
    state = repo?.removeArticleItem(id);
  }

  ///Update  current todo from local Storage

  void updateArticleItem(int index, ArticleItem articleItem) {
    state = repo?.updateArticleItem(index, articleItem);
  }

  void clearArticles() {
    repo?.deleteAll();
    state = [];
  }
}

/// This is  hive Data provider like Controller for our application
final bookmarkStateNotifieer =
    StateNotifierProvider<BookmarkStateNotifier, List<ArticleItem>?>(
        (ref) => BookmarkStateNotifier(ref));
