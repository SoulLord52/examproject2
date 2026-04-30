import 'package:bloc/bloc.dart';
import '../../core/service/ApiService.dart';
import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState());

  Future<void> getTeslaNews() async {
    emit(HomeLoadingState());
    final result = await ApiService.getTeslaNews();
    emit(HomeLoadedState(newsModel: result));
  }

  Future<void> getAppleNews() async {
    emit(HomeLoadingState());
    final result = await ApiService.getAppleNews();
    emit(HomeLoadedState(newsModel: result));
  }

  Future<void> getTopNews() async {
    emit(HomeLoadingState());
    final result = await ApiService.getTopHeadlinesNews();
    emit(HomeLoadedState(newsModel: result));
  }
  void checkIndex(int index) {
    state.newsIndex = index;
    if (index == 0) {
      getAppleNews();
    } else if (index == 1) {
      getTeslaNews();
    } else {
      getTopNews();
    }
  }
}