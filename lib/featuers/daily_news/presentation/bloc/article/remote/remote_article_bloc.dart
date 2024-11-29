import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean/featuers/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean/featuers/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/use_cases/get_article.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState.data != null && dataState.data!.isNotEmpty) {
      log("[Data] - ${dataState.data.toString()}");
      emit(RemoteArticlesDone(dataState.data!));
    } else if (dataState is DataFailed && dataState.error != null) {
      log("[Error] - ${dataState.error?.message.toString()}");
      emit(RemoteArticlesError(dataState.error!));
    } else {
      log("[Warning] - No data or error provided");
      // emit(const RemoteArticlesError(null));
    }
  }
}
