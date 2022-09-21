import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scratchfood/API/main_api_controller.dart';
import 'package:scratchfood/Screens/LoginAndCreeatAccount/LoginScreen.dart';
import 'package:scratchfood/Screens/MainScreen/MainScreenController.dart';
import 'package:scratchfood/get/profile/profileGetxController.dart';

import '../../get/main/MainGetxController.dart';
import '../../prefs/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);
  static String screenNamed = '/lunch_screen';

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  var controller = Get.put<MainController>(MainController());
  var controller2 = Get.put<ProfileGetxController>(ProfileGetxController());

  @override
  void initState() {
    super.initState();
    String loggedIn =
        SharedPrefController().getValueFor<bool>(PrefKeys.loggedIn.name) ??
                false
            ? MainScreenController.mainScreenNamed
            : LoginScreen.loginScreenNamed;
    if (loggedIn ==  LoginScreen.loginScreenNamed) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, loggedIn);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        controller.getRecipes();

        ProfileGetxController.to.getUserProfile(
            id: int.parse(
                SharedPrefController().getValueFor(PrefKeys.id.name)));

        ProfileGetxController.to.getFollowing(
            id: int.parse(
                SharedPrefController().getValueFor(PrefKeys.id.name)));
        Navigator.pushReplacementNamed(context, loggedIn);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/Image/splash_image.png',
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.jpg'),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'Scratch',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
