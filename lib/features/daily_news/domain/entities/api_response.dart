import 'package:equatable/equatable.dart';

class ApiResponseEntity extends Equatable {
  final String status;
  final int totalResults;
  final List<ArticleModelEntity> articles;

  const ApiResponseEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  List<Object?> get props => [status, totalResults, articles];
}

class ArticleModelEntity extends Equatable {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  const ArticleModelEntity({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  @override
  List<Object?> get props => [title, description, url, urlToImage, publishedAt];
}
