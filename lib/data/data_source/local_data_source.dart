import 'dart:convert';

import 'package:news_app/core/app_strings.dart';
import 'package:news_app/core/cache_data.dart';
import 'package:news_app/data/news_modal.dart';

class LocalDataSource {
  // List<NewsModal>

  Future<void> saveHomeNews(List<NewsModal> news) async {
    List home = news
        .map<Map<String, dynamic>>((homeNews) => homeNews.toJson())
        .toList();
    await SharedData.saveData(
        key: AppStrings.cacheHome, value: jsonEncode(home));
  }

  //Get Our Home Data

  Future<List<NewsModal>> getHomeNews() async {
    final homeNews = await SharedData.getData(key: AppStrings.home);
    if (homeNews != null) {
      List<NewsModal> list = (jsonDecode(homeNews) as List)
          .map((home) => NewsModal.fromJson(home))
          .toList();

      return Future.value(list);
    } else {
      return [];
    }
  }

  Future<void> saveCategoryNews(
      List<NewsModal> categoryNews, String category) async {
    List news = categoryNews
        .map<Map<String, dynamic>>((category) => category.toJson())
        .toList();
    await SharedData.saveData(key: category, value: jsonEncode(news));
  }

  Future<List<NewsModal>> getCategoryData(String category) async {
    final categoryNews = await SharedData.getData(key: category);
    if (categoryNews != null) {
      List<NewsModal> list = (jsonDecode(categoryNews) as List)
          .map((home) => NewsModal.fromJson(home))
          .toList();

      return Future.value(list);
    } else {
      return [];
    }
  }
}
