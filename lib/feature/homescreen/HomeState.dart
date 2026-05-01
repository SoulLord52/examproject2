import '../../core/model/NewsModel.dart';

abstract class HomeState {
  static bool isPasswordVisible = false;
  int newsIndex = 0;
}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorText;
  HomeErrorState({
    required this.errorText,
  });
}

class HomeLoadedState extends HomeState {
  final newsModel;
  final int index;
  final List<Article> bookmarked;
  HomeLoadedState({required this.newsModel,  required this.index, required this.bookmarked,});
}