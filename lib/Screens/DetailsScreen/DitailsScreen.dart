import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ShardDesgin/ShardWidget.dart';
import '../MainScreen/ProfileScreen/FollowingPage.dart';
import '../MainScreen/ProfileScreen/RecipesPage.dart';
import '../MainScreen/ProfileScreen/SavedPage.dart';
import 'AdditionalInfoPage.dart';
import 'HowToCookPage.dart';
import 'IngereduentsPage.dart';

class DitailsScreen extends StatefulWidget {
  const DitailsScreen({Key? key}) : super(key: key);
  static String screenNamed = '/DitailsScreen';

  @override
  State<DitailsScreen> createState() => _DitailsScreenState();
}

class _DitailsScreenState extends State<DitailsScreen>
    with TickerProviderStateMixin {
  var images = [
    'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350',
  ];
  var selectedItem = -1;
  late final Animation<double> _animationLeftToRight;
  late final AnimationController _controllerLeftToRight;
  var commentController = TextEditingController();
  var arrayPages = [
    IngereduentsPage(ingereduents: const [
      'sda',
      'sda',
      'sda',
      'sda',
    ]),
    HowToCookPage(howTocook: 'asd'),
    AdditionalInfoPage(
      addition: const [
        'sda',
        'sda',
        'sda',
        'sda',
      ],
    )
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

  @override
  Widget build(BuildContext context) {
    print(images.length);
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leadingWidth: 120.w,
                  elevation: 0,
                  expandedHeight: 350.0.h,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      foregroundDecoration:
                          BoxDecoration(color: Colors.black87.withOpacity(.2)),
                      child: Image.network(
                        "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Engine-Cooked Honey Orange Pancake',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                blurRadius: 200,
                                offset: Offset(1, 1))
                          ]),
                    ),
                    titlePadding:
                        EdgeInsets.only(left: 20.w, right: 10.w, bottom: 25.h),
                  ),
                  actions: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          border: Border.all(
                            width: 2.0,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.play_arrow_outlined,
                              size: 25,
                            ),
                            Text(
                              'Cook Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey[200],
                            size: 20,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                                fontSize: 14.sp, color: Colors.grey[200]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  images != null
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          child: images.length == 1
                              ? Container(
                                  height: 95.h,
                                  width: 105.w,
                                  child: Image(
                                    image: NetworkImage(images[0]),
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : images.length == 2
                                  ? Row(
                                      children: [
                                        Container(
                                          height: 95.h,
                                          width: 105.w,
                                          child: Image(
                                            image: NetworkImage(images[0]),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Container(
                                          height: 95.h,
                                          width: 105.w,
                                          child: Image(
                                            image: NetworkImage(images[1]),
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      ],
                                    )
                                  : images.length >= 3
                                      ? Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 95.h,
                                                child: Image(
                                                  image:
                                                      NetworkImage(images[0]),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 95.h,
                                                child: Image(
                                                  image:
                                                      NetworkImage(images[1]),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                              child: Container(
                                                  height: 95.h,
                                                  child: Stack(
                                                    children: [
                                                      Image(
                                                        image: NetworkImage(
                                                            images[2]),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      images.length > 3
                                                          ? Container(
                                                              height: double
                                                                  .infinity,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          .7)),
                                                              child: Center(
                                                                child: Text(
                                                                  '+${images.length - 3}',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline5
                                                                      ?.copyWith(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: 24
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        )
                                      : Container(),
                        )
                      : Container(),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                    ),
                    height: 64.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
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
                                    text: 'Ingredients',
                                    isSelected: selectedItem == 0,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  selectedItem == 0
                                      ? SizeTransition(
                                          sizeFactor: _animationLeftToRight,
                                          axis: Axis.horizontal,
                                          axisAlignment: 0,
                                          child: Container(
                                            height: 3.5.h,
                                            decoration: const BoxDecoration(
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
                                      text: 'How to Cook',
                                      isSelected: selectedItem == 1),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  selectedItem == 1
                                      ? SizeTransition(
                                          sizeFactor: _animationLeftToRight,
                                          axis: Axis.horizontal,
                                          axisAlignment: 0,
                                          child: Container(
                                            height: 3.5.h,
                                            decoration: const BoxDecoration(
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
                          flex: 2,
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
                                      text: 'Additional Info',
                                      isSelected: selectedItem == 2),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  selectedItem == 2
                                      ? SizeTransition(
                                          sizeFactor: _animationLeftToRight,
                                          axis: Axis.horizontal,
                                          axisAlignment: 0,
                                          child: Container(
                                            height: 3.5.h,
                                            decoration: const BoxDecoration(
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
                                print('asdasd');
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
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: arrayPages[selectedItem],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.black
                        : Colors.white,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'Comments',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(fontSize: 22.sp),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.w),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: 14.h,
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: const Divider(),
                                );
                              },
                              itemBuilder: (context, index) {
                                return _commentBulder(
                                    commentContent: 'asd  bfd as q',
                                    commenterName: ' asd');
                              },
                              itemCount: 5,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 36.h,
                                margin: EdgeInsets.only(left: 8.w),
                                child: DottedBorder(
                                  color: Color(0xff979797),
                                  borderType: BorderType.RRect,
                                  strokeCap: StrokeCap.round,
                                  dashPattern: [6, 5],
                                  radius: Radius.circular(8.r),
                                  strokeWidth: 1,
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    margin: EdgeInsetsDirectional.only(
                                      start: 4.w,
                                      top: 15.h,
                                    ),
                                    child: TextFormField(
                                      controller: commentController,
                                      decoration: InputDecoration(
                                          hintText: 'Comment',
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                    ),
                                  ),
                                ),
                              )),
                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                elevation: 3,
                                color: Colors.black54,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(2000.r)),
                                child: Container(
                                  height: 36.h,
                                  width: 36.h,
                                  child: Icon(
                                    Icons.send_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget _commentBulder({
    required String commenterName,
    required String commentContent,
  }) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commenterName,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15.sp),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 8.w),
            child: Text(
              commentContent,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 15.sp),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
