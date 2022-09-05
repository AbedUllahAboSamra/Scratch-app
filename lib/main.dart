import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/Screens/LoginAndCreeatAccount/LoginScreen.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  var asfd   = ' ';
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
