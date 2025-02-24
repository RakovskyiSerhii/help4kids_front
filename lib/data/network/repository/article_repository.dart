// File: lib/repositories/article_repository.dart
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';
import 'package:help4kids_front/data/model/article.dart';
import 'package:help4kids_front/data/model/article_category.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';
import 'base_repository.dart';

@lazySingleton
class ArticleRepository extends BaseRepository {
  final ApiClient _apiClient;
  ArticleRepository(this._apiClient);

  Future<Either<Failure, List<Article>>> getAllArticles() async {
    return invokeRequest(() => _apiClient.getAllArticles());
  }

  Future<Either<Failure, Article>> getArticleById(String articleId) async {
    return invokeRequest(() => _apiClient.getArticleById(articleId));
  }

  Future<Either<Failure, List<ArticleCategory>>> getAllArticleCategories() async {
    return invokeRequest(() => _apiClient.getAllArticleCategories());
  }
}