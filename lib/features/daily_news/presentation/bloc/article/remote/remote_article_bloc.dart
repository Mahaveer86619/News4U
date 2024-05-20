import 'package:dio/dio.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_top_headlines.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetTopHeadlinesUseCase _getTopHeadlinesUseCase;

  RemoteArticleBloc(this._getTopHeadlinesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetTopHeadlines>(onGetTopHeadlines);
  }

  void onGetTopHeadlines(
    GetTopHeadlines event,
    Emitter<RemoteArticleState> emit,
  ) async {
    final dataState = await _getTopHeadlinesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesDone(dataState.data!),
      );
    }

    if (dataState is DataFailure) {
      emit(
        RemoteArticlesError(
          DioException(
              message: dataState.error!.message,
              requestOptions: dataState.error!.requestOptions),
        ),
      );
    }
  }
}
