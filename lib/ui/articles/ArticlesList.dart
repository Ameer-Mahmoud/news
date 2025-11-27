import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/remote/network/ApiManager.dart';
import 'package:news/model/sources/Source.dart';
import 'package:news/ui/articles/ArticleItem.dart';

import '../../model/Articles/Article.dart';
import '../../model/Articles/ArticlesResponse.dart';

class ArticlesList extends StatefulWidget {
  final Source source;
  const ArticlesList({required this.source});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(widget.source.id!),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError){
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text("Try Again"))
            ],
          );
        }
        ArticlesResponse? articlesResponse = snapshot.data;
        if(articlesResponse?.status=="error"){
          return Column(
            children: [
              Text(articlesResponse?.message??""),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text("Try Again"))
            ],
          );
        }
        List<Article> articlesList = articlesResponse?.articles??[];
        return ListView.separated(
            itemBuilder: (context, index) => Articleitem(
              article: articlesList[index],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h,),
            itemCount: articlesList.length
        );
      },
    );
  }
}
