import 'package:news4u/core/resources/data_state.dart';
import 'package:news4u/features/daily_news/domain/entities/articles.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticlesEntity>>> getTopHeadlinesArticles();
}
