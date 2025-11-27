import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/resources/AssetsManager.dart';
import 'package:news/core/resources/StringsManager.dart';

import '../../../core/resources/ColorManager.dart';

class Homedrawer extends StatelessWidget {
  final void Function() goTOHome;
  const Homedrawer({required this.goTOHome});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:ColorManager.lightPrimaryColor,
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 166.h,
          width: double.infinity,
          color: ColorManager.lightSecondaryColor,
          child: Text(StringsManager.appTitle,style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
            color: ColorManager.lightPrimaryColor
          ),),
        ),
        Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  goTOHome();
                },
                child: Row(
                  children: [
                    SvgPicture.asset(AssetsManager.home,
                    width: 24.w,
                    height: 24.h,),
                    SizedBox(width: 8.w,),
                    Text(StringsManager.goToHome,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.lightSecondaryColor
                        ),)
                  ],
                ),
              )
            ],
          ),
        )
      ],
      ),
    );
  }
}
