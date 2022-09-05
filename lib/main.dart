import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/Screens/LoginAndCreeatAccount/LoginScreen.dart';
import 'package:scratchfood/Screens/MainScreen/MainScreenController.dart';

void main() {
  runApp(MaterialApp(home: MainScreenController()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      );
    }
    ); }
  }
