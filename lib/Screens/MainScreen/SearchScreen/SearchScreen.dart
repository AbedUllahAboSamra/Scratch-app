import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../ShardDesgin/ShardWidget.dart';
import '../../../SplitCode/ProviderSwitchUpdate.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var isVisible = false;

  var recpceArray = [
    'Potato',
    'Banana',
    'Tomato',
    'Potato',
    'Banana',
    'Tomato',
    'Potato',
    'Banana',
    'Tomato',
    'Potato',
    'Banana',
    'Tomato',
  ];

  var selectedItem = 0;
  RangeValues _currentRangeValues = RangeValues(10, 30);
  var startTime = 40;
  var endTime = 80;
  var ingredientsNum = 8;

  var filterRecipesIsSelected = false;
  var filterProfilesIsSelected = false;
  var filterTagsIsSelected = false;

  var filterbuttonPresed = false;

  @override
  Widget build(BuildContext context) {
    var a = Provider.of<ProviderSwitchUpdate>(context).isVisibleSearchScreen;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(top: 25.h),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 70.h, bottom: 25.h),
                  child: Row(
                    children: [
                      Text(
                        'Trending Recipes',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      isVisible
                          ? InkWell(
                              onTap: () {},
                              child: Text(
                                'show all (200+)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF30BE76),
                                    ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Container(
                  height: 240.h,
                  margin: EdgeInsets.only(left: 20.w),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SharedSearchRecipesDesign(
                        context: context,
                        recipesName: 'abod ras dasd asd e $index',
                        imageUrl: 'assets/Image.jpg',
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 16.w,
                      );
                    },
                  ),
                ),
                Container(
                  height: 1.5.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.grey[300]
                          : Colors.grey[600],
                      borderRadius: BorderRadius.circular(50.r)),
                ),
                // items what i can do
                if (!isVisible)
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                    child: Row(
                      children: [
                        Text(
                          'What can I make with..',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                if (!isVisible)
                  Container(
                    height: 50.h,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: recpceArray.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              selectedItem = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20.w : 8.w,
                              right: 8.w,
                              top: 4.h,
                              bottom: 4.h,
                            ),
                            child: Text(
                              recpceArray[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: selectedItem == index
                                        ? MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black
                                        : Colors.grey[400],
                                  ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (!isVisible)
                  Container(
                    height: 210.h,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return SharedSearchRecipes2Design(
                            context: context,
                            imageUrl:
                                'https://source.unsplash.com/1600x900/?portrait',
                            recipesName:
                                'name asd asd asd asd as das s da asd as dasdf sdf sdf sd asdas d as$index',
                            index: index);
                      },
                    ),
                  ),
                //profile
                if (isVisible)
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                    child: Row(
                      children: [
                        Text(
                          'Profiles',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        isVisible
                            ? InkWell(
                                onTap: () {},
                                child: Text(
                                  'show all (18+)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF30BE76),
                                      ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                if (isVisible)
                  Container(
                    height: 260.h,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return SharedSearchProfileCardDesign(
                            context: context,
                            numberOfFollowers: 80,
                            chefName: 'chefName $index',
                            lastPostImageUrl:
                                'https://source.unsplash.com/1600x900/?portrait',
                            numberOfRecipes: 20,
                            chefImageUrl:
                                'https://xsgames.co/randomusers/avatar.php?g=female',
                            index: index);
                      },
                    ),
                  ),
                SizedBox(
                  height: 24.h,
                ),
                if (isVisible)
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Tags',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'show all (18+)',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF30BE76),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isVisible)
                  Container(
                    margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return SharedTagDesignItem(
                            context: context,
                            followersNum: index * 10 - 2 * index,
                            likesNum: 50 + index * 2,
                            tagName: '#abodAyman$index');
                      },
                    ),
                  ),
              ],
            ),
            Column(
              children:[

                Card(
                  elevation: 100,

                  margin: EdgeInsets.symmetric(horizontal: 20.h),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),
                    bottomRight:  filterbuttonPresed?Radius.zero:Radius.circular(10.r),
                    bottomLeft:  filterbuttonPresed?Radius.zero:Radius.circular(10.r)

                    ),

                  ),
                  color: MediaQuery.of(context).platformBrightness ==
                      Brightness.light
                      ? Colors.white
                      : Color(0x51777777),
                  child: TextFormField(
                    onChanged: (text) {
                      if (text.length > 0) {
                        setState(() {
                          isVisible = true;
                        });
                      } else {
                        setState(() {
                          isVisible = false;
                        });
                      }
                    },
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search recipe, people, or tag',
                      hintStyle:
                      Theme.of(context).textTheme.bodyText2?.copyWith(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                            ? Color(0xFF363837)
                            : Color(0x8EF3F3F3),
                      ),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.filter_list_rounded,
                          color:
                          MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                              ? Color(0xFF363837)
                              : Color(0x8EF3F3F3),
                        ),
                        onPressed: () {
                          setState(() {
                            filterbuttonPresed=!filterbuttonPresed;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                filterbuttonPresed? Card(
                  elevation: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),),
                  ),
                  child: Container(
                    height: 475.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.h),
                          child: Text(
                            'Search Filter',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Ingredients',
                                style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                ingredientsNum.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Slider(
                            value: double.parse(ingredientsNum.toString()),
                            onChanged: (a) {
                              setState(() {
                                ingredientsNum = int.parse(a.toString());
                              });
                            },
                            activeColor: Color(0xFF30BE76),
                            max: 20,
                            min: 5,
                            inactiveColor: Colors.grey[300],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Serving Time',
                                style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                ' mins',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: RangeSlider(
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                            divisions: 25,
                            inactiveColor: Colors.grey[300],
                            onChangeEnd: (end) {
                              setState(() {
                                print(int.parse('${_currentRangeValues.end}'));
                              });
                            },
                            activeColor: Color(0xFF30BE76),
                            max: 200,
                            min: 10,
                            values: _currentRangeValues,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.h, left: 20.w),
                          child: Text(
                            'Search for',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 29.h,
                                  decoration: BoxDecoration(
                                      color: filterRecipesIsSelected
                                          ? Color(0xFF30BE76)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(500.r),
                                      border: Border.all(
                                          color: Color(0xFF30BE76), width: 1)),
                                  margin: EdgeInsets.only(
                                      left: 16.w,
                                      right: 16.w,
                                      top: 16.h,
                                      bottom: 20.h),
                                  child: MaterialButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        filterRecipesIsSelected =
                                        !filterRecipesIsSelected;
                                      });
                                    },
                                    child: Text(
                                      '298 recipes',
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                          fontSize: 15,
                                          color: filterRecipesIsSelected
                                              ? Colors.white
                                              : Color(0xFF30BE76),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 29.h,
                                  decoration: BoxDecoration(
                                      color: filterTagsIsSelected
                                          ? Color(0xFF30BE76)
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Color(0xFF30BE76), width: 1),
                                      borderRadius: BorderRadius.circular(500.r)),
                                  margin: EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                  ),
                                  child: MaterialButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        filterTagsIsSelected =
                                        !filterTagsIsSelected;
                                      });
                                    },
                                    child: Text(
                                      '326 tags',
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                          fontSize: 15,
                                          color: filterTagsIsSelected
                                              ? Colors.white
                                              : Color(0xFF30BE76),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 29.h,
                              decoration: BoxDecoration(
                                  color: filterProfilesIsSelected
                                      ? Color(0xFF30BE76)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: Color(0xFF30BE76), width: 1),
                                  borderRadius: BorderRadius.circular(500.r)),
                              margin: EdgeInsets.only(
                                  right: 16.w, top: 16.h, bottom: 20.h),
                              child: MaterialButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    filterProfilesIsSelected =
                                    !filterProfilesIsSelected;
                                  });
                                },
                                child: Text(
                                  '78 profiles',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                      fontSize: 15,
                                      color: filterProfilesIsSelected
                                          ? Colors.white
                                          : Color(0xFF30BE76),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ShardMaterialButton(
                          context: context,
                          lableText: 'Apply Filter',
                          onPresed: () {},
                          margenTop: 20.0,
                          margenBottom: 0.0,

                        ),
                      ],
                    ),
                  ),
                ):Container(),

              ]
            ) ,
          ],
        ),
      ),
    );
  }
}
