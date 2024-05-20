import 'package:news4u/features/daily_news/domain/entities/articles.dart';

class ArticlesModel extends ArticlesEntity {
  const ArticlesModel({
    int? id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  }) : super(
          id: id ?? 0,
        );

  factory ArticlesModel.fromJson(Map<String, dynamic> map) {
    return ArticlesModel(
      author: map['author'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      url: map['url'] as String?,
      urlToImage: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] as String?,
      content: map['content'] as String?,
    );
  }
}
