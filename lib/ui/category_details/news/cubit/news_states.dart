import '../../../../model/NewsResponce.dart';

abstract class NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsSuccessState extends NewsStates {
  List<News> newsList;

  NewsSuccessState({required this.newsList});
}

class NewsErrorState extends NewsStates {
  String errorMessage;

  NewsErrorState({required this.errorMessage});
}
