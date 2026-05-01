import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/model/NewsModel.dart';
import '../../core/service/ApiService.dart';
import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState()) {
    getAppleNews();
  }
  List<Article> _bookmarked = [];
  Future<void> getAppleNews() async {
    try {
      emit(HomeLoadingState());
      final data = await ApiService.getAppleNews();
      print('AppleNews success');
      emit(HomeLoadedState(newsModel: data, index: 0, bookmarked: _bookmarked,));
    } catch (e) {
      print('AppleNews unsuccess');
      emit(HomeErrorState(errorText: e.toString()));
    }
  }

  Future<void> getTeslaNews() async {
    try {
      emit(HomeLoadingState());
      final data = await ApiService.getTeslaNews();
      print('TeslaNews success');
      emit(HomeLoadedState(newsModel: data, index: 1, bookmarked: _bookmarked,));
    } catch (e) {
      print('TeslaNews success');
      emit(HomeErrorState(errorText: e.toString()));
    }
  }

  Future<void> getTopHeadlineNew() async {
    try {
      emit(HomeLoadingState());
      final data = await ApiService.getTopHeadlinesNews();
      print('HeadlineNews success');
      emit(HomeLoadedState(newsModel: data, index: 2, bookmarked: _bookmarked,));
    } catch (e) {
      print('HeadlineNews success');
      emit(HomeErrorState(errorText: e.toString()));
    }
  }

  void tapIndex(int index) {
    if (index == 0) {
      getAppleNews();
    } else if (index == 1) {
      getTeslaNews();
    } else {
      getTopHeadlineNew();
    }
  }
  void toggleBookmark(Article article) {
    if (_bookmarked.contains(article)) {
      _bookmarked.remove(article);
    } else {
      _bookmarked.add(article);
    }

    if (state is HomeLoadedState) {
      final current = state as HomeLoadedState;

      emit(HomeLoadedState(
        newsModel: current.newsModel,
        index: current.index,
        bookmarked: _bookmarked,
      ));
    }
  }

  bool isBookmarked(Article article) {
    return _bookmarked.contains(article);
  }
}