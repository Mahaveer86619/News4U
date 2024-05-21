import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news4u/features/daily_news/presentation/widgets/news_articles.dart';
import 'package:news4u/features/daily_news/presentation/widgets/top_headlines_tile.dart';

import '../../../../../core/constants/constants.dart';
import '../../widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _categorySelected;

  @override
  void initState() {
    super.initState();
    _categorySelected = "general";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.background,
          title: Text(
            // * App Title
            'News4U',
            style: TextStyle(
              fontSize: theme.textTheme.bodyLarge?.fontSize,
              color: theme.colorScheme.onBackground,
            ),
          ),
          actions: [
            // * Search Icon
            CircleAvatar(
              backgroundColor: theme.colorScheme.surface,
              child: Icon(
                Icons.search,
                color: theme.colorScheme.onBackground,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              // * Profile Icon
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  child: Image(
                    image: AssetImage('assets/logo/news4u_logo.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: _buildUi(),
        ),
      ),
    );
  }

  Widget _buildUi() {
    const List<String> categories = newsCategoryList;
    return Column(
      children: [
        // * Category list
        CategorySelector(
          categories: categories,
          onCategorySelected: (category) {
            setState(() {
              _categorySelected = category;
            });
          },
        ),

        // * Vertical List
        const SizedBox(
          height: 16,
        ),
        Expanded(child: _buildTopHeadlines()),
      ],
    );
  }

  _buildTopHeadlines() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteArticlesError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticlesDone) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsArticlesTile(articlesEntity: state.articles![index]);
          },
          itemCount: state.articles!.length,
        );
      }
      return const SizedBox();
    });
  }
}
