import 'package:dio/dio.dart';
import 'package:news_app/core/api_service/api_consts.dart';
import 'package:news_app/core/api_service/api_consumer.dart';
import 'package:news_app/core/api_service/app_interceptors.dart';
import 'package:news_app/core/exception.dart';

class DioConsumer implements ApiConsumer {
  late final Dio _dio;

  DioConsumer(this._dio) {
    _dio.options
      ..baseUrl = ApiConstants.baseUrl
      ..responseType = ResponseType.json
      ..receiveTimeout = const Duration(seconds: 20)
      ..connectTimeout = const Duration(seconds: 20)
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < 500;
      };

    _dio.interceptors.add(AppInterceptors());
  }

  @override
  Future delete(String path, {Map<String, dynamic>? body}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async{
    // TODO: implement get
    try {
      final response = await _dio.get(path,queryParameters: queryParameters);
      if(response.statusCode == 200 || response.statusCode ==201){
        return response.data;
      }else{
        throw ServerException(response.data['message']);
      }
    } on DioException catch (error){
      throw ServerException(error.response!.data['message']);
    }
  }

  @override
  Future post(String path, {Map<String, dynamic>? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String path, {Map<String, dynamic>? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
