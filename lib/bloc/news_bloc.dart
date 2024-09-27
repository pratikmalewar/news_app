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
  int page = 1;
  int categoryPage = 1;

  NewsBloc(this._newsRepo) : super(NewsStates()) {
    on<HomeEvents>((events, emit) async {
      emit(state.copyWith(homeStatus: NewsStatus.loading));
      final response = await _newsRepo.getHomeData(page: page++);

      response.fold(
        (left) => emit(state.copyWith(
            homeError: left.message, homeStatus: NewsStatus.error)),
        (homeNews) {
          // state .homeNews is []
          // [] => homeNews
          // homeNews will add another of homeNews list from the next page
          homeNews.isEmpty
              ? emit(state.copyWith(homeStatus: NewsStatus.success))
              : emit(state.copyWith(
            homeNewsList: List.of(state.homeNewsList)..addAll(homeNews),
            homeStatus: NewsStatus.success,
          ));
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
          await _newsRepo.getCategoryData(category: events.category,page: categoryPage++);

      success.fold(
        (left) => emit(
          state.copyWith(
              categoryError: left.message, categoryStatus: NewsStatus.error),
        ),
        (categoryNews) {
          categoryNews.isEmpty
              ? emit(state.copyWith(categoryStatus: NewsStatus.success))
              : emit(state.copyWith(
                  categoryNewsList: List.of(state.categoryNewsList)
                    ..addAll(categoryNews),
                  categoryStatus: NewsStatus.success,
                ));
        },
      );
    });
  }
}
