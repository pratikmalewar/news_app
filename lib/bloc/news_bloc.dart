import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_events.dart';
import 'package:news_app/bloc/news_states.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/data/news_modal.dart';

import '../core/api_service/api_consts.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  List<NewsModal> news = [];

  NewsBloc() : super(NewsStatesInitial()) {
    on<HomeEvents>((events, emit) async {
      emit(HomeLoadingState());
      Dio dio = Dio();
      final response = await dio.get(ApiConstants().url);

      try {
        news = response.data['articles']
            .map<NewsModal>((news) => NewsModal.fromJson(news))
            .toList();
        //Success
        emit(HomeSuccessState());
      } on DioException catch (error){
        emit(HomeErrorState(error: error.toString()));

      }
    });
  }
}
