import 'package:news4u/core/resources/data_state.dart';
import 'package:news4u/core/usecases/usecase.dart';
import 'package:news4u/features/daily_news/domain/entities/articles.dart';
import 'package:news4u/features/daily_news/domain/repositories/article_repository.dart';

class GetTopHeadlinesUseCase
    implements UseCase<DataState<List<ArticlesEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetTopHeadlinesUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticlesEntity>>> call({void params}) {
    return _articleRepository.getTopHeadlinesArticles();
  }
}
