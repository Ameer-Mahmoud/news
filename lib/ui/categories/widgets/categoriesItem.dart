import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/resources/AppStyle.dart';
import 'package:news/core/resources/AssetsManager.dart';
import 'package:news/core/resources/ColorManager.dart';
import 'package:news/core/resources/StringsManager.dart';
import 'package:news/model/CategoryModel.dart';

class Categoriesitem extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final void Function(String) onCategoryClick;
  const Categoriesitem({
    required this.index,
    required this.categoryModel,
    required this.onCategoryClick
  });

  @override
  Widget build(BuildContext context) {
    // Force Light Theme for Category Cards as per requirements
    return Theme(
      data: AppStyle.lightTheme, 
      child: Builder(
        builder: (context) {
          return Directionality(
            textDirection:  index.isEven ?TextDirection.ltr:TextDirection.rtl,
            child: Container(
              height: 198.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: ColorManager.lightPrimaryColor, // Keeps original black color
                borderRadius: BorderRadius.circular(24.r),
      
              ),
              child: Row(
                children: [
                  Image.asset(categoryModel.imagePath,height: 198.h,
                    width: 180.w,
                    fit: BoxFit.cover,
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
      
                      Text(categoryModel.title,style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.lightSecondaryColor
                      ),),
                      Container(
                        padding: REdgeInsetsDirectional.only(start: 16.r),
                        decoration: BoxDecoration(
                      color: ColorManager.lightSecondaryColor.withOpacity(.5),
                       borderRadius: BorderRadius.circular(84.r),
                        ),
                        child: InkWell(
                          onTap: (){
                            onCategoryClick(categoryModel.title);
                          },
                          child: Row(
      
                            children: [
                               Text(StringsManager.viewAll,style:TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.lightPrimaryColor
                                ) ,),
      
                              SizedBox(width: 10.w,),
                              CircleAvatar(
                                backgroundColor: ColorManager.lightSecondaryColor,
                                radius: 27.r,
                                child: SvgPicture.asset(AssetsManager.arrow,matchTextDirection: true,),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
