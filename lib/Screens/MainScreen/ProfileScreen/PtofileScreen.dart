// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scratchfood/API/profile_api_controller.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/EditeProfile.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/RecipesPage.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/SavedPage.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/Settings.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/followers_screen.dart';
import 'package:scratchfood/get/profile/profileGetxController.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';

import '../../../ShardDesgin/ShardWidget.dart';
import 'FollowingPage.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  ProfileGetxController profileGetxController =
      Get.put(ProfileGetxController());
  late final AnimationController _controllerLeftToRight;

  late final Animation<double> _animationLeftToRight;

  var selectedItem = -1;
  var arrayPages = [RecipesPage(), SavedPage(), FollowingPage()];

  @override
  void initState() {
    selectedItem = 0;
    _controllerLeftToRight = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    )..forward();

    // print(SharedPrefController().getValueFor(PrefKeys.id.name));

    Future.delayed(Duration(seconds: 0),() {
      profileGetxController.getUserProfile(
          id: int.parse(SharedPrefController().getValueFor(PrefKeys.id.name)));


    },);
    Future.delayed(Duration(seconds: 0),() {
      profileGetxController.getFollowing(
          id: int.parse(SharedPrefController().getValueFor(PrefKeys.id.name)));
    },);
    _controllerLeftToRight.forward(
      from: 0,
    );
    _animationLeftToRight = CurvedAnimation(
      parent: _controllerLeftToRight,
      curve: Curves.fastOutSlowIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controllerLeftToRight.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GetX<ProfileGetxController>(
      builder: (controller) {
        return controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
                      child: Row(
                        children: [
                          Text(
                            'My Kitchen',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(),
                          ),
                          Spacer(),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Settings(),
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings_outlined,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  'Settings',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      height: 82.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SharedCircllerImage(ImageLink: 'assets/Image.jpg'),
                          SizedBox(
                            width: 14.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userProfile.value.name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                controller.userProfile.value.email!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontSize: 14,
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.light
                                            ? Color(0xFF606060)
                                            : Colors.grey[200]),
                              ),
                              Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Text(
                                      '${controller.userProfile.value.followCount!} followers',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              fontSize: 14.sp,
                                              color: MediaQuery.of(context)
                                                          .platformBrightness ==
                                                      Brightness.light
                                                  ? Color(0xFF606060)
                                                  : Colors.grey[200]),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context, FollowersScreen.ScreenNamed);
                                    },
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Container(
                                    height: 3.w,
                                    width: 3.w,
                                    decoration: BoxDecoration(
                                      color: MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.light
                                          ? Color(0xFF979797)
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    '${controller.userProfile.value.likesCount!} likes',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                            fontSize: 14.sp,
                                            color: MediaQuery.of(context)
                                                        .platformBrightness ==
                                                    Brightness.light
                                                ? Color(0xFF606060)
                                                : Colors.grey[200]),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditeProfile(),
                              ));
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit_outlined,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      height: 1.5.h,
                      decoration: BoxDecoration(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Colors.grey[300]
                              : Colors.grey[600],
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      height: 64.h,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Column(
                                  children: [
                                    ShardTextToTabView(
                                        context: context,
                                        text: '20',
                                        isSelected: selectedItem == 0),
                                    Spacer(),
                                    ShardTextToTabView(
                                        context: context,
                                        text: 'Recipes',
                                        isSelected: selectedItem == 0),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Spacer(),
                                    selectedItem == 0
                                        ? SizeTransition(
                                            sizeFactor: _animationLeftToRight,
                                            axis: Axis.horizontal,
                                            axisAlignment: 0,
                                            child: Container(
                                              width: 82.w,
                                              height: 3.5.h,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF30BE76),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft: Radius.zero,
                                                  bottomRight: Radius.zero,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 3.5.h,
                                          ),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedItem = 0;
                                    _controllerLeftToRight.forward(
                                      from: 0,
                                    );
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Column(
                                  children: [
                                    ShardTextToTabView(
                                        context: context,
                                        text: '75',
                                        isSelected: selectedItem == 1),
                                    Spacer(),
                                    ShardTextToTabView(
                                        context: context,
                                        text: 'Saved',
                                        isSelected: selectedItem == 1),
                                    Spacer(),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    selectedItem == 1
                                        ? SizeTransition(
                                            sizeFactor: _animationLeftToRight,
                                            axis: Axis.horizontal,
                                            axisAlignment: 0,
                                            child: Container(
                                              width: double.infinity,
                                              height: 3.5.h,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF30BE76),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft: Radius.zero,
                                                  bottomRight: Radius.zero,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 3.5.h,
                                          ),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedItem = 1;
                                    _controllerLeftToRight.forward(
                                      from: 0,
                                    );
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Column(
                                  children: [
                                    ShardTextToTabView(
                                        context: context,
                                        text: '248',
                                        isSelected: selectedItem == 2),
                                    Spacer(),
                                    ShardTextToTabView(
                                        context: context,
                                        text: 'Following',
                                        isSelected: selectedItem == 2),
                                    Spacer(),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    selectedItem == 2
                                        ? SizeTransition(
                                            sizeFactor: _animationLeftToRight,
                                            axis: Axis.horizontal,
                                            axisAlignment: 0,
                                            child: Container(
                                              width: 82.w,
                                              height: 3.5.h,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF30BE76),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft: Radius.zero,
                                                  bottomRight: Radius.zero,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 3.5.h,
                                          ),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedItem = 2;
                                    _controllerLeftToRight.forward(
                                      from: 0,
                                    );
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      height: 1.5.h,
                      decoration: BoxDecoration(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Colors.grey[300]
                              : Colors.grey[600],
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    arrayPages[selectedItem],
                    SizedBox(
                      height: 5,
                    )
                  ]),
                ),
              );
      },
    );
  }
}
