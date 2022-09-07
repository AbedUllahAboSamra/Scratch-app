import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/LoginAndCreeatAccount/CreateAccountScreen.dart';

void main() {
  runApp(const MyApp());
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
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                headline1: GoogleFonts.nunito(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                headline2: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                headline3: GoogleFonts.nunito(
                  fontSize: 22,

                  color: Colors.black,
                ),
                bodyText1: GoogleFonts.nunito(
                    fontSize: 18,
                    color: Colors.black),
                bodyText2: GoogleFonts.nunito(
                  fontSize: 17,
                  color: Colors.black,
                ),
                headline6: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300
                ),
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
                    fontSize: 15,
                    color: Colors.grey[500]
                ),
              ),

            ),
            home: CreateAccountScreen(),
          );
        });
  }
  }
