import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

import '../../widgets/article.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      ),
      body: BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
        builder: (_, state) {
          if (state is RemoteArticlesLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteArticlesError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteArticlesDone) {
            return ListView.builder(
              itemCount: state.response?.articles.length,
              itemBuilder: (context, index) {
                return ArticleWidget(article: state.response?.articles[index]);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
