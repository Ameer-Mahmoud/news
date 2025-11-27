import 'package:dio/dio.dart';

import '../../../model/Articles/ArticlesResponse.dart';
import '../../../model/sources/SourcesResponse.dart';
import '../../resources/AppConstants.dart';

class ApiManager {
  static Dio dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveTimeout: Duration(seconds: 3),
          sendTimeout: Duration(seconds: 3),
          connectTimeout: Duration(seconds: 3)
      )
  );
  static Future<SourcesResponse> getSources(String category)async{


      var response = await dio.get("/v2/top-headlines/sources", queryParameters: {
        "apiKey":apiKey,
        "category":category

      });
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      return sourcesResponse;
  }
  static Future<ArticlesResponse> getArticles(String source)async{
    var response = await dio.get("/v2/everything",queryParameters: {
      "apiKey":apiKey,
      "sources":source
    });
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse;
  }
  static Future<ArticlesResponse> searchArticles(String query) async {
    var response = await dio.get("/v2/everything", queryParameters: {
      "apiKey": apiKey,
      "q": query,
      "sortBy": "publishedAt",
      "language": "en",
    });

    return ArticlesResponse.fromJson(response.data);
  }

}