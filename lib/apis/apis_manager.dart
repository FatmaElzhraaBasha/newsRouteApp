import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_route_app/apis/apis_constants.dart';
import 'package:news_route_app/apis/end_points.dart';
import 'package:news_route_app/model/NewsResponce.dart';
import 'package:news_route_app/model/SourceResponse.dart';
class ApisManager{
  /*
  https://newsapi.org/v2/top-headlines/sources?
  apiKey=b66f9f162dee4672857c79ab75aa4874
   */
  static Future<SourceResponse?> getSources(String categoryId,
      String language) async {
    Uri url = Uri.https(ApisConstants.baseUrl,
        EndPoints.sourceApi,{
          'apiKey': ApisConstants.apiKey,
          'category': categoryId,
          'language': language
        }
    );
    try{
      var response = await http.get(url);
      var responseBody = response.body;  //todo: String
      //todo: String => json
      var json = jsonDecode(responseBody);
      //todo: json => object
      // SourceResponse.fromJson(jsonDecode(response.body));
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=b66f9f162dee4672857c79ab75aa4874
   */

  static Future<NewsResponse?> getNewsBySourceId(String sourceId,
      String language) async {
    Uri url = Uri.https(ApisConstants.baseUrl,
      EndPoints.newsApi,
      {
        'apiKey' : ApisConstants.apiKey,
        'sources': sourceId,
        'language': language
      }
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }
}