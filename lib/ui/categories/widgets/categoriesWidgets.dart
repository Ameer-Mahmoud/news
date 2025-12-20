import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/resources/ColorManager.dart';
import 'package:news/core/resources/StringsManager.dart';
import 'package:news/model/CategoryModel.dart';
import 'package:news/ui/categories/widgets/categoriesItem.dart';

class Categorieswidgets extends StatelessWidget {
  final void Function(String) onCategoryClick;
  const Categorieswidgets({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        
        children: [
          Text(StringsManager.welcome,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder:(context, index) => Categoriesitem(index: index,
                onCategoryClick: onCategoryClick,
                categoryModel: CategoryModel.categories[index],),
                separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                itemCount: CategoryModel.categories.length),
          )
        ],
      ),
    );
  }
}
