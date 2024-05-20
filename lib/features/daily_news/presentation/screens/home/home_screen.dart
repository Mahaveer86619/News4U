import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news4u/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news4u/features/daily_news/presentation/widgets/news_articles.dart';
import 'package:news4u/features/daily_news/presentation/widgets/top_headlines_tile.dart';

import '../../../../../core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _categorySelected;

  @override
  void initState() {
    super.initState();
    _categorySelected = 0;
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
        // * Horizontal List
        const SizedBox(
          height: 200,
          width: double.infinity,
          child: Placeholder(),
        ),
        // * Category list
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 50.0, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = _categorySelected == index;
              return InkWell(
                onTap: () {
                  setState(() {
                    _categorySelected = index;
                  });
                },
                child: Center(
                  child: buildCategoryItem(
                    category,
                    isSelected,
                  ),
                ),
              ); // Replace with your category item builder function
            },
          ),
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

  Widget buildCategoryItem(String category, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        category,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
