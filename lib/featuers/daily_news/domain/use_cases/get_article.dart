import 'package:news_app_clean/featuers/daily_news/domain/entities/article.dart';
import 'package:news_app_clean/featuers/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/use_cases/use_case.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
