import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/remote/network/ApiManager.dart';
import 'package:news/core/resources/AppConstants.dart';
import 'package:news/core/resources/ColorManager.dart';
import 'package:news/ui/articles/ArticlesList.dart';

import '../../model/sources/Source.dart';
import '../../model/sources/SourcesResponse.dart';

class Articleswidget extends StatefulWidget {
  final category;
  const Articleswidget({ required this.category});

  @override
  State<Articleswidget> createState() => _ArticleswidgetState();
}

class _ArticleswidgetState extends State<Articleswidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.category),

        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            // handle loading case
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            // handle error case
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
          SourcesResponse? sourcesResponse = snapshot.data;
          if(sourcesResponse?.status=="error"){
            return Column(
              children: [
                Text(sourcesResponse?.message??""),
                ElevatedButton(onPressed: (){}, child: Text("Try Again"))
              ],
            );
          }
          List<Source> sourcesList = sourcesResponse?.sources??[];
          return Padding(
            padding: REdgeInsets.all(16),
            child: DefaultTabController(
              length: sourcesList.length,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    dividerHeight: 0,
                    indicatorColor: ColorManager.lightPrimaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabAlignment: TabAlignment.center,
                    unselectedLabelStyle:TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: ColorManager.lightPrimaryColor
                    ),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: ColorManager.lightPrimaryColor
                    ),

                    tabs:
                    sourcesList.map((source) => Tab(text: source.name)).toList(),),
                  SizedBox(height: 16.h,),

                  Expanded(child:
                  TabBarView(children:
                  sourcesList.map((source) => ArticlesList(source: source,),).toList()))
                ],
              ),
            ),
          );
        },
    );


  }
}
