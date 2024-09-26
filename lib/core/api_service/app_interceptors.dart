import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AppInterceptors extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "*/*";

    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response ${response.data}');
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Response ${err.response!.data}');

    // TODO: implement onError
    super.onError(err, handler);
  }
}
