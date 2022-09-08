import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ShardDesgin/ShardWidget.dart';
import 'MainScreen/ProfileScreen/FollowingPage.dart';
import 'MainScreen/ProfileScreen/RecipesPage.dart';
import 'MainScreen/ProfileScreen/SavedPage.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>  with TickerProviderStateMixin{
  late final AnimationController _controllerLeftToRight;

  late final Animation<double> _animationLeftToRight;

  var selectedItem = -1;

  var arrayPages = [
    RecipesPage(),
     FollowingPage()
  ];

  @override
  void initState() {
    selectedItem = 0;
    _controllerLeftToRight = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    )..forward();

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

  var arr = [RecipesPage(), SavedPage(), FollowingPage(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                  top: 32.h
              ),
              child: Row(
                children: [
                  Text(
                    'My Kitchen',
                    style:
                    Theme.of(context).textTheme.headline2?.copyWith(),
                  ),
                  Spacer(),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: () {
                      setState(() {});
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
                        'User Name',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Potato Master',
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
                          Text(
                            '502 followers',
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
                          SizedBox(
                            width: 8.w,
                          ),
                          Container(
                            height: 4.w,
                            width: 4.w,
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
                            '23k likes',
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
              height: 6.h,
            ),
            ShardMaterialButton(context: context, lableText: 'Follow', onPresed: (){} , ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 25.w,
                right: 25.w,
              ),
              height: 64.h,
              width: double.infinity,
              child: Row(
                 children: [
                  Expanded(
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
                          selectedItem = 0;
                          _controllerLeftToRight.forward(
                            from: 0,
                          );
                        });
                      },
                    ),
                  ),

                  Expanded(
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
                          selectedItem = 2;
                          _controllerLeftToRight.forward(
                            from: 0,
                          );
                        });
                      },
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
            arr[selectedItem],
            SizedBox(
              height: 5,
            ),

          ]),
        ),
      ),
    );
  }
}
