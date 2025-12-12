import 'package:flutter/material.dart';
import 'package:news/core/remote/network/ApiManager.dart';
import 'package:news/model/Articles/Article.dart';

class ArticlesListViewmodel extends ChangeNotifier{
  bool isLoading = false;
  List<Article> articles = [];
  String? errorMessage;
  fetchArticle(String source)async {
    isLoading =true;
    notifyListeners();
     var response =  await ApiManager.getArticles(source);
     isLoading = false;
     try{
       if(response.status=="error"){
         errorMessage = response.message;

       }else{
         articles = response.articles??[];

       }
       notifyListeners();

     }catch(e){
       isLoading = false;

     }
  }

}