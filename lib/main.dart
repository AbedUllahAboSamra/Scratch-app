// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/EditeProfile.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/followers_screen.dart';
import 'package:scratchfood/Screens/lunch_screen/launch_screen.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';
import 'Screens/DetailsScreen/DitailsScreen.dart';
import 'Screens/LoginAndCreeatAccount/CreateAccountScreen.dart';
import 'Screens/LoginAndCreeatAccount/LoginScreen.dart';
import 'Screens/MainScreen/AddScreens/AddCategoryScreen.dart';
import 'Screens/MainScreen/AddScreens/add_recipes_screen.dart';
import 'Screens/MainScreen/MainScreenController.dart';
import 'get/setting/SettingController.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: TextTheme(
                  headline1: GoogleFonts.nunito(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  headline2: GoogleFonts.nunito(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  headline3: GoogleFonts.nunito(
                    fontSize: 22.sp,
                    color: Colors.black,
                  ),
                  headline5: GoogleFonts.nunito(
                     color: Colors.black,
                  ),
                  bodyText1:
                      GoogleFonts.nunito(fontSize: 18.sp, color: Colors.black),
                  bodyText2: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                  headline6: GoogleFonts.nunito(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[500]!,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[500]!,
                    ),
                  ),
                  labelStyle:
                      GoogleFonts.neuton(fontSize: 15, color: Colors.grey[500]),
                ),

                iconTheme: IconThemeData(
                  color: Color(0xFF363837),
                  size: 24,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                ),
              ),
              themeMode: ThemeMode.system,
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: Colors.black87,
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Color(0x51777777),
                    elevation: 10,
                  ),
                  textTheme: TextTheme(
                    headline1: GoogleFonts.nunito(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    headline2: GoogleFonts.nunito(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ), headline5: GoogleFonts.nunito(
                    color: Colors.white,
                  ),
                    headline3: GoogleFonts.nunito(
                      fontSize: 22.sp,
                      color: Colors.white,
                    ),
                    bodyText1:
                        GoogleFonts.nunito(fontSize: 18, color: Colors.white),
                    bodyText2: GoogleFonts.nunito(
                      fontSize: 17.sp,
                      color: Colors.white,
                    ),
                    headline6: GoogleFonts.nunito(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[500]!,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[500]!,
                      ),
                    ),
                    labelStyle: GoogleFonts.neuton(
                        fontSize: 15, color: Colors.grey[500]),
                  ),
                  iconTheme: IconThemeData(
                    color: Color(0xFFE3E3E3),
                    size: 24,
                  )),
              initialRoute: LaunchScreen.screenNamed,
              routes: {
                LaunchScreen.screenNamed :(context)=>LaunchScreen(),
                MainScreenController.mainScreenNamed :(context)=>MainScreenController(),
                LoginScreen.loginScreenNamed :(context)=>LoginScreen(),
                FollowersScreen.ScreenNamed :(context)=>FollowersScreen(),
                AddRecipeScreen.screenNamed : (context)=>AddRecipeScreen(),
                AddCategoryScreen.screenNamed : (context)=>AddCategoryScreen(),
              },
              navigatorKey: Get.key,
            );
          });
  }
}
