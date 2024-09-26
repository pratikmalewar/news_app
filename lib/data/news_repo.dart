import 'package:news_app/core/api_service/api_consts.dart';
import 'package:news_app/core/api_service/api_consumer.dart';
import 'package:news_app/data/news_modal.dart';

class NewsRepo {
  final ApiConsumer _apiConsumer;

  NewsRepo(this._apiConsumer);

  Future<List<NewsModal>> getHomeData() async {
    final response = await _apiConsumer.get(ApiConstants.headlineEndPoint,queryParameters: ApiConstants.query);
    final List<NewsModal> news = response['articles']
        .map<NewsModal>((articles) => NewsModal.fromJson(articles))
        .toList();

    return news;
  }
}
