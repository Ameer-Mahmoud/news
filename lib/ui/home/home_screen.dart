import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/resources/AssetsManager.dart';
import 'package:news/core/resources/ColorManager.dart';
import 'package:news/ui/articles/articlesWidget/ArticlesWidget.dart';
import 'package:news/ui/categories/widgets/categoriesWidgets.dart';
import 'package:news/ui/home/widgets/homeDrawer.dart';

import '../search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
       List <String> title =[];
       List <String> images =[];
    return Scaffold(
      appBar:
      AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(selectedCategory== null? "Home":selectedCategory!,style:
          Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp)
        ,),
        actions: [IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SearchScreen()),
          );
        },
            icon: SvgPicture.asset(AssetsManager.search,
            height: 24.h,
            width: 24.w,
            colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            )
        )
        ],

      ),
      drawer: Homedrawer(goTOHome: () {
        selectedCategory = null;
        Navigator.pop(context);
        setState(() {

        });
      },),
      body:selectedCategory == null ?
      Categorieswidgets( onCategoryClick: onCategoryClick,)
      : Articleswidget(category: selectedCategory,),
    );
  }

  onCategoryClick(String newCategory){
    selectedCategory =newCategory;
    setState(() {

    });



  }
}
