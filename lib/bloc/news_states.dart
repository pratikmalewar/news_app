import 'package:news_app/data/news_modal.dart';

abstract class NewsState {}

final class NewsStatesInitial extends NewsState {}

final class HomeSuccessState extends NewsState {}

final class HomeLoadingState extends NewsState {}

final class HomeErrorState extends NewsState {
  final String error;

  HomeErrorState({required this.error});
}

final class CategorySuccessState extends NewsState {
  List<NewsModal> news = [];
  CategorySuccessState({required this.news});

}

final class CategoryErrorState extends NewsState {
  final String error;

  CategoryErrorState({required this.error});
}
final class CategoryLoadingState extends NewsState {}
