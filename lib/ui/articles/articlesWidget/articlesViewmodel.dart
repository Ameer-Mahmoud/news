import 'package:flutter/material.dart';
import 'package:news/model/sources/Source.dart';

import '../../../core/remote/network/ApiManager.dart';

class ArticlesViewmodel extends ChangeNotifier {
  String? errorMessage;
  List<Source> sources = [];
  bool isLoading = false;

  fetchSources(String category )async {
    isLoading = true;
    notifyListeners();
     var sourcesResponse = await ApiManager.getSources(category);
     isLoading = false;
    try{
      if(sourcesResponse.status== "error"){
        errorMessage = sourcesResponse.message??"";

      }else{
        sources = sourcesResponse.sources??[];
      }
      notifyListeners();

    }catch(e){
      isLoading = false;
      errorMessage= e.toString();
      notifyListeners();

    }
  }


}