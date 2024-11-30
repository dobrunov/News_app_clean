import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/api_response.dart';

abstract class RemoteArticleState extends Equatable {
  final ApiResponseEntity? response;
  final DioException? error;

  const RemoteArticleState({this.response, this.error});

  @override
  List<Object> get props => [response!, error!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(ApiResponseEntity response) : super(response: response);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
