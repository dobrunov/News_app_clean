import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean/core/constants.dart';
import 'package:news_app_clean/core/resources/data_state.dart';
import 'package:news_app_clean/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean/features/daily_news/domain/repository/article_repository.dart';

import '../models/api_response_model.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<ApiResponseModel>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
