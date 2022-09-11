import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scratchfood/Screens/MainScreen/SplitCode/ProviderSwitchUpdate.dart';
import 'Screens/LoginAndCreeatAccount/CreateAccountScreen.dart';
import 'Screens/MainScreen/MainScreenController.dart';
import 'Screens/UserProfileScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderSwitchUpdate(),
        ),
      ],
      child: ScreenUtilInit(
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
              home: MainScreenController(),
            );
          }),
    );
  }
}
