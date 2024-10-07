import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:news_app/data/models/articles/Articles.dart';

class ArticleRepo {
  late Box<ArticleItem> _hive;
  late List<ArticleItem> _box;

  ArticleRepo();

  List<ArticleItem> getArticlesItem() {
    /// Fetch the Todos from the "todos" database
    _hive = Hive.box<ArticleItem>('articlesDB');
    _box = _hive.values.toList();
    return _box;
  }

  /// Add Article to Database
  List<ArticleItem> addArticleItem(ArticleItem article) {
    _hive.add(article);
    return _hive.values.toList();
  }

  /// Remove Particular Article by id
  List<ArticleItem> removeArticleItem(String id) {
    _hive.deleteAt(_hive.values
        .toList()
        .indexWhere((element) => element.article_id == id));
    return _hive.values.toList();
  }

  /// Update Article
  List<ArticleItem> updateArticleItem(int index, ArticleItem todo) {
    _hive.putAt(index, todo);
    return _hive.values.toList();
  }

  /// Delete All Article in Database
  void deleteAll() {
    _box.clear();
  }
}

final articleCacheRepositoryProvider =
    Provider<ArticleRepo>((ref) => ArticleRepo());
