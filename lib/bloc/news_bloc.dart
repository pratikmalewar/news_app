import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_events.dart';
import 'package:news_app/bloc/news_states.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/data/news_modal.dart';
import 'package:news_app/data/news_repo.dart';

import '../core/api_service/api_consts.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  List<NewsModal> news = [];
  final NewsRepo _newsRepo;

  NewsBloc(this._newsRepo) : super(NewsStatesInitial()) {
    on<HomeEvents>((events, emit) async {
      emit(HomeLoadingState());
      final response = await _newsRepo.getHomeData();

      response.fold(
        (left) => emit(HomeErrorState(error: left.message)),
        (listOfNews) {
          news = listOfNews;
          emit(HomeSuccessState());
        },
      );

      // emit(HomeLoadingState());
      // Dio dio = Dio();
      // final response = await dio.get(ApiConstants().url);
      //
      // try {
      //   news = response.data['articles']
      //       .map<NewsModal>((news) => NewsModal.fromJson(news))
      //       .toList();
      //   //Success
      //   emit(HomeSuccessState());
      // } on DioException catch (error){
      //   emit(HomeErrorState(error: error.toString()));
      //
      // }
    });

    on<CategoryEvents>((events, emit) async {
      emit(CategoryLoadingState());
      final success =
          await _newsRepo.getCategoryData(category: events.category);

      success.fold(
        (l) => emit(CategoryErrorState(error: l.message)),
        (r) => emit(CategorySuccessState(news: r)),
      );
    });
  }
}
