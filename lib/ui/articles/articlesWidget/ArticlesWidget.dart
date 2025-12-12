import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/resources/ColorManager.dart';
import 'package:news/ui/articles/articlesList/ArticlesList.dart';
import 'package:news/ui/articles/articlesWidget/articlesViewmodel.dart';
import 'package:provider/provider.dart';
import '../../../model/sources/Source.dart';

class Articleswidget extends StatefulWidget {
  final category;
  const Articleswidget({ required this.category});

  @override
  State<Articleswidget> createState() => _ArticleswidgetState();
}

class _ArticleswidgetState extends State<Articleswidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticlesViewmodel()..fetchSources(widget.category),
      child: Consumer<ArticlesViewmodel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator(),);
            }
            if (viewModel.errorMessage != null) {
              return Column(
                children: [
                  Text(viewModel.errorMessage ?? ""),
                  ElevatedButton(onPressed: () {
                    viewModel.fetchSources(widget.category);
                  }, child: Text("Try Again"))
                ],
              );
            }
            List<Source> sourcesList = viewModel.sources;
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
                      unselectedLabelStyle: TextStyle(
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
                      sourcesList.map((source) => Tab(text: source.name))
                          .toList(),),
                    SizedBox(height: 16.h,),

                    Expanded(child:
                    TabBarView(children:
                    sourcesList.map((source) => ArticlesList(source: source,),)
                        .toList()))
                  ],
                ),
              ),
            );
          }

      ),
    );
  }
}
