
abstract class NewsState {}

final class NewsStatesInitial extends NewsState {}
final class HomeSuccessState extends NewsState {}
final class HomeLoadingState extends NewsState {}
final class HomeErrorState extends NewsState {

  final String error;
  HomeErrorState({required this.error});
}
