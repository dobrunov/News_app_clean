import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants.dart';
import '../../models/api_response_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) {
    dio.options = BaseOptions(
      baseUrl: newsAPIBaseURL,
      validateStatus: (status) {
        log('[Status code] - ${status.toString()}');
        return status != null && status < 500;
      },
    );

    return _NewsApiService(dio);
  }

  @GET('/top-headlines')
  Future<HttpResponse<ApiResponseModel>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
