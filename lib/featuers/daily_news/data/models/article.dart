import '../../domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    final String? title,
    final String? description,
    final String? url,
    final String? urlToImage,
    final String? publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
    );
  }
}
