import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_events.dart';
import 'package:news_app/bloc/news_states.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/data/news_modal.dart';
import 'package:news_app/data/news_repo.dart';

import '../core/api_service/api_consts.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  // List<NewsModal> news = [];
  final NewsRepo _newsRepo;

  NewsBloc(this._newsRepo) : super(NewsStates()) {
    on<HomeEvents>((events, emit) async {
      emit(state.copyWith(homeStatus: NewsStatus.loading));
      final response = await _newsRepo.getHomeData();

      response.fold(
        (left) => emit(state.copyWith(
            homeError: left.message, homeStatus: NewsStatus.error)),
        (listOfNews) {
          // news = listOfNews;
          emit(state.copyWith(
              homeNewsList: listOfNews, homeStatus: NewsStatus.success));
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
      emit(state.copyWith(categoryStatus: NewsStatus.loading));
      final success =
          await _newsRepo.getCategoryData(category: events.category);

      success.fold(
        (left) => emit(
          state.copyWith(
              categoryError: left.message, categoryStatus: NewsStatus.error),
        ),
        (listOfNews) => emit(
          state.copyWith(
              categoryNewsList: listOfNews, categoryStatus: NewsStatus.success),
        ),
      );
    });
  }
}
