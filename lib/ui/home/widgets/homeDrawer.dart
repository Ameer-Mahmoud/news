import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/provider/ThemeProvider.dart';
import 'package:news/core/resources/AssetsManager.dart';
import 'package:news/core/resources/StringsManager.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/ColorManager.dart';

class Homedrawer extends StatelessWidget {
  final void Function() goTOHome;
  const Homedrawer({super.key, required this.goTOHome});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 166.h,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Text(StringsManager.appTitle,style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
            color: Theme.of(context).colorScheme.onPrimary
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
                    height: 24.h,
                    colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                    ),
                    SizedBox(width: 8.w,),
                    Text(StringsManager.goToHome,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp))
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Icon(Icons.brightness_6, color: Theme.of(context).iconTheme.color),
                  SizedBox(width: 8.w),
                  Text("Dark Mode", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp)),
                  Spacer(),
                  Switch(
                    value: themeProvider.isDark(), 
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool newValue) {
                      themeProvider.changeTheme(newValue ? ThemeMode.dark : ThemeMode.light);
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
      ),
    );
  }
}
