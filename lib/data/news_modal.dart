import 'package:equatable/equatable.dart';
import 'package:news_app/core/app_strings.dart';

class NewsModal extends Equatable{
  String? title, author, urlTOImage, publishedAt, description;

  NewsModal({
    required this.title,
    required this.author,
    required this.urlTOImage,
    required this.publishedAt,
    required this.description,
  });

  factory NewsModal.fromJson(Map<String, dynamic> json) {
    return NewsModal(
      title: json['title']??'',
      author: json['author']??'',
      urlTOImage: json['urlToImage']?? AppStrings.defaultIMage,
      publishedAt: json['publishedAt']??'',
      description: json['description']??'',
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    author,
    urlTOImage,
    publishedAt,
    description,
  ];
}
