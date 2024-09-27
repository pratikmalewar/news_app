class ApiConstants {
  String url =
      'https://newsapi.org/v2/top-headlines?country=Us&apiKey=64355725cf514e44b0d5922ec4c55a3a&category=sports';

  static String baseUrl = 'https://newsapi.org/v2/';
  static String headlineEndPoint = "top-headlines";

  static Map<String, dynamic> query({String? category, int? page}) => {
        'country': "Us",
        "category": category ?? "sports",
        'apiKey': '64355725cf514e44b0d5922ec4c55a3a',
        'pageSize': 10,
        'page': page ?? 1,
      };
}
