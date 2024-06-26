import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news4u/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news4u/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news4u/features/daily_news/domain/repositories/article_repository.dart';
import 'package:news4u/features/daily_news/domain/usecases/get_top_headlines.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // ApiService in data
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // Repositories in domain
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetTopHeadlinesUseCase>(GetTopHeadlinesUseCase(sl()));

  // Bloc
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
