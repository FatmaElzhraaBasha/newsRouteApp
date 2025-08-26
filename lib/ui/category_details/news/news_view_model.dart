import 'package:flutter/material.dart';
import 'package:news_route_app/apis/apis_manager.dart';

import '../../../model/NewsResponce.dart';

class NewsViewModel extends ChangeNotifier {
  //todo: hold data - handle logic
  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    //todo: reinitialize
    newsList = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await ApisManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        //todo: error
        errorMessage = response!.message;
      } else {
        //todo: success
        newsList = response!.articles!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
