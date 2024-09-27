import 'package:equatable/equatable.dart';
import 'package:news_app/data/news_modal.dart';

enum NewsStatus { loading, success, error }

class NewsStates extends Equatable {
  final NewsStatus homeStatus;
  final NewsStatus categoryStatus;
  final List<NewsModal> homeNewsList;
  final List<NewsModal> categoryNewsList;
  final String homeError;
  final String categoryError;

  NewsStates({
    this.homeStatus = NewsStatus.loading,
    this.categoryStatus = NewsStatus.loading,
    this.homeNewsList = const [],
    this.categoryNewsList = const [],
    this.homeError = '',
    this.categoryError = '',
  });

  NewsStates copyWith({
    NewsStatus? homeStatus,
    NewsStatus? categoryStatus,
    List<NewsModal>? homeNewsList,
    List<NewsModal>? categoryNewsList,
    String? homeError,
    String? categoryError,
  }) {
    return NewsStates(
      homeStatus: homeStatus ?? this.homeStatus,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      homeNewsList: homeNewsList ?? this.homeNewsList,
      categoryNewsList: categoryNewsList ?? this.categoryNewsList,
      homeError: homeError ?? this.homeError,
      categoryError: categoryError ?? this.categoryError,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoryStatus,
        categoryNewsList,
        categoryError,
        homeStatus,
        homeError,
        homeNewsList
      ];
}

// abstract class NewsState {}
//
// final class NewsStatesInitial extends NewsState {}
//
// final class HomeSuccessState extends NewsState {}
//
// final class HomeLoadingState extends NewsState {}
//
// final class HomeErrorState extends NewsState {
//   final String error;
//
//   HomeErrorState({required this.error});
// }
//
// final class CategorySuccessState extends NewsState {
//   List<NewsModal> news = [];
//   CategorySuccessState({required this.news});
//
// }
//
// final class CategoryErrorState extends NewsState {
//   final String error;
//
//   CategoryErrorState({required this.error});
// }
// final class CategoryLoadingState extends NewsState {}
