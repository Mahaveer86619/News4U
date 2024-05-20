import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news4u/features/daily_news/domain/entities/articles.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticlesEntity>? articles;
  final DioException? dioException;

  const RemoteArticleState({this.articles, this.dioException});

  @override
  List<Object> get props => [articles!, dioException!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}
class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticlesEntity> article) : super(articles: article);
}
class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException exception) : super(dioException: exception);
}
