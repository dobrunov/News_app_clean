import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_clean/features/daily_news/domain/use_cases/get_article.dart';

import 'features/daily_news/data/repository/article_repository_impl.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());
  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  //
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  // Bloc
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
