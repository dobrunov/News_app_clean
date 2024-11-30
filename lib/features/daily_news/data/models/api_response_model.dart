import '../../domain/entities/api_response.dart';

class ApiResponseModel extends ApiResponseEntity {
  const ApiResponseModel({
    required super.status,
    required super.totalResults,
    required List<ArticleModel> super.articles,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List).map((article) => ArticleModel.fromJson(article as Map<String, dynamic>)).toList(),
    );
  }
}

class ArticleModel extends ArticleModelEntity {
  const ArticleModel({
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
    );
  }
}
