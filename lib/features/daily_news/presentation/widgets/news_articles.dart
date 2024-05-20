import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news4u/core/constants/constants.dart';

import '../../domain/entities/articles.dart';

class NewsArticlesTile extends StatelessWidget {
  final ArticlesEntity articlesEntity;

  const NewsArticlesTile({
    super.key,
    required this.articlesEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImage(context, articlesEntity.urlToImage),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articlesEntity.title ?? "No title available",
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.labelSmall?.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    articlesEntity.publishedAt ?? "No date available",
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String? url) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          key: UniqueKey(),
          imageUrl: url ?? brokenImage,
          placeholder: (context, url) => const CupertinoActivityIndicator(),
          errorWidget: (context, url, error) {
            debugPrint('Image loading error: $error');
            return const Icon(Icons.error);
          },
          height: 100,
          width: 100,
        ),
      ],
    );
  }
}
