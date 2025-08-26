import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_route_app/apis/apis_manager.dart';
import 'package:news_route_app/ui/category_details/cubit/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  SourcesViewModel() : super(SourceLoadingState());

  //todo: hold data - handle logic
  //List<Source>? sourcesList;
  void getSources(String categoryId) async {
    try {
      //todo: loading
      emit(SourceLoadingState());
      var response = await ApisManager.getSources(categoryId);
      if (response?.status == 'error') {
        //todo: server => error
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        //todo: server => success
        emit(SourceSuccessState(sourcesList: response!.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
