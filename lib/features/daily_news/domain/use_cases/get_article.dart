import 'package:news_app_clean/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/api_response.dart';

class GetArticleUseCase implements UseCase<DataState<ApiResponseEntity>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<ApiResponseEntity>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
