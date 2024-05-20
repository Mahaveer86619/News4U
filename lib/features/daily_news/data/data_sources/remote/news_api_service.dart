import 'package:dio/dio.dart';
import 'package:news4u/core/constants/constants.dart';
import 'package:news4u/features/daily_news/data/models/articles.dart';
import 'package:retrofit/http.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<Response<List<ArticlesModel>>> getTopHeadlinesArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
