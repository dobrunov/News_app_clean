import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;

  const ArticleEntity({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  @override
  List<Object?> get props {
    return [
      title,
      description,
      url,
      urlToImage,
      publishedAt,
    ];
  }
}
