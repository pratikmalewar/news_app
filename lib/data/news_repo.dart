import 'package:dartz/dartz.dart';
import 'package:news_app/core/api_service/api_consts.dart';
import 'package:news_app/core/api_service/api_consumer.dart';
import 'package:news_app/core/exception.dart';
import 'package:news_app/data/news_modal.dart';

class NewsRepo {
  final ApiConsumer _apiConsumer;

  NewsRepo(this._apiConsumer);

  Future<Either<Failure, List<NewsModal>>> getHomeData(
  { int? page}
      ) async {
    try {
      final response = await _apiConsumer.get(ApiConstants.headlineEndPoint,
          queryParameters: ApiConstants.query(page: page??1));
      final List<NewsModal> news = response['articles']
          .map<NewsModal>((articles) => NewsModal.fromJson(articles))
          .toList();

      return Right(news);
    } on ServerException catch (e) {
     return left(ServerFailure(e.message.toString()));
    }
  }

  Future<Either<Failure, List<NewsModal>>>  getCategoryData({required String category,  int? page}) async {
    try {

      final response = await _apiConsumer.get(ApiConstants.headlineEndPoint,
        queryParameters: ApiConstants.query(category: category,page: page ??1));
    final List<NewsModal> news = response['articles']
        .map<NewsModal>((articles) => NewsModal.fromJson(articles))
        .toList();

      return Right(news);
    } on ServerException catch (e) {
     return left(ServerFailure(e.message.toString()));
    }

  }
}
