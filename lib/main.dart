import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/provider/ThemeProvider.dart';
import 'package:news/core/resources/AppStyle.dart'; // Ensure AppStyle is imported
import 'package:news/ui/home/home_screen.dart';
import 'package:news/ui/search/search_screen.dart';
import 'package:provider/provider.dart';

import 'core/resources/RoutesManager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context); // Get provider
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'news app',
          theme: AppStyle.lightTheme, 
          darkTheme: AppStyle.darkTheme, 
          themeMode: themeProvider.themeMode, 
          initialRoute: RoutesManager.home,
          routes: {
            RoutesManager.home:(_)=>HomeScreen(),
            RoutesManager.search:(_)=>SearchScreen()
          },
        );
      },
    );
  }
}