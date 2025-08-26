import 'package:flutter/material.dart';
import 'package:news_route_app/apis/apis_manager.dart';
import 'package:news_route_app/model/SourceResponse.dart';

class SourcesViewModel extends ChangeNotifier {
  //todo: hold data - handle logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    //todo: reinitialize
    sourcesList = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await ApisManager.getSources(categoryId);
      if (response?.status == 'error') {
        //todo: error
        errorMessage = response!.message;
      } else {
        //todo: success
        sourcesList = response!.sources!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
