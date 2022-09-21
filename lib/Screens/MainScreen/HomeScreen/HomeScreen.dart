import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scratchfood/Screens/MainScreen/AddScreens/AddCategoryScreen.dart';
import 'package:scratchfood/Screens/MainScreen/HomeScreen/HomeCardDetails.dart';

import '../../../get/main/MainGetxController.dart';

class Home extends StatelessWidget {
  var controller = Get.put<MainController>(MainController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75.h,
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.only(left: 25.w, right: 25.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: const AssetImage('assets/logo.jpg'),
                        height: 28.r,
                        width: 18.r),
                    SizedBox(
                      width: 7.w,
                    ),
                    const Text("scratch",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Get.toNamed(AddCategoryScreen.screenNamed);
                      },
                      icon: Icon(
                        Icons.notifications_none,
                        size: 20.h,
                      ),
                    ),
                    IconButton(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Icon(
                          Icons.mail_outline,
                          size: 20.h,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GetX<MainController>(
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.recipeList.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
               itemBuilder:(context , index ){
                  return HomeCardDetails(recipeModel: controller.recipeList[index],);
               },

              );

            },
          ),
        ),
      ],
    );
  }
}
