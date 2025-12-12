import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/model/sources/Source.dart';
import 'package:news/ui/articles/ArticleItem.dart';
import 'package:news/ui/articles/articlesList/ArticlesListViewmodel.dart';
import 'package:provider/provider.dart';
import '../../../model/Articles/Article.dart';

class ArticlesList extends StatefulWidget {
  final Source source;
  const ArticlesList({required this.source});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticlesListViewmodel()..fetchArticle(widget.source.id!),
      child: Consumer<ArticlesListViewmodel>(
        builder: (context, viewModel, child) {
          if(viewModel.isLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(viewModel.errorMessage != null){
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(onPressed: (){
                  viewModel.fetchArticle(widget.source.id!);
                }, child: Text("Try Again"))
              ],
            );

          }
          List<Article> articlesList = viewModel.articles;
          return ListView.separated(
              itemBuilder: (context, index) => Articleitem(
                article: articlesList[index],
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h,),
              itemCount: articlesList.length
          );
          },
      ),

    );
  }
}
