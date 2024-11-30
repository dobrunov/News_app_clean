import '../../../../core/resources/data_state.dart';
import '../entities/api_response.dart';

abstract class ArticleRepository {
  Future<DataState<ApiResponseEntity>> getNewsArticles();
}
