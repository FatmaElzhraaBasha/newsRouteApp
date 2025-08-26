import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route_app/apis/apis_manager.dart';
import 'package:news_route_app/ui/category_details/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsViewModel() : super(NewsLoadingState());

  //todo: hold data - handle logic
  void getNewsBySourceId(String sourceId) async {
    try {
      //todo: loading
      emit(NewsLoadingState());
      var response = await ApisManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        //todo: error
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        //todo: success
        emit(NewsSuccessState(newsList: response!.articles!));
        return;
      }
    } catch (e) {
      //todo: error
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
