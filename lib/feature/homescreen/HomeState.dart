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
  HomeLoadedState({required this.newsModel});
}