import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news4u/core/constants/constants.dart';
import 'package:news4u/core/resources/data_state.dart';
import 'package:news4u/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news4u/features/daily_news/data/models/articles.dart';
import 'package:news4u/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  // Returns a list of article model from the api
  @override
  Future<DataState<List<ArticlesModel>>> getTopHeadlinesArticles() async {
    try {
      final httpResponse = await _newsApiService.getTopHeadlinesArticles(
        apiKey: newsApiKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data!);
      } else {
        return DataFailure(DioException(
          error: httpResponse.statusMessage,
          requestOptions: httpResponse.requestOptions,
          type: DioExceptionType.unknown,
        ));
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }
}
