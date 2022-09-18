import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/model/recipe.dart';

class HomeCardDetails extends StatelessWidget {
  RecipeModel recipeModel;
   HomeCardDetails({super.key,required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
      width: 300.w,
      height: 550.h,
      decoration: BoxDecoration(
        color: MediaQuery.of(context).platformBrightness==Brightness.light?
        Colors.white:Color(0x51777777),

        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
            width: double.infinity,
            height: 70.h,
            child: Row(
              children: [
                Image.asset("assets/Image/avatar.png"),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipeModel.nameUser!,
                        style:  Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 12.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        "2h ago",
                        style:
                        Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 11.sp,
                         ),

                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 302.h,
            child: Image.asset(
              "assets/Image/Feed_Card.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(
               recipeModel.name!,
                  style:  Theme.of(context).textTheme.bodyText2?.copyWith(
                       fontWeight: FontWeight.w600
                  ),

                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline,
                     )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13.w),
            child: Text(
              recipeModel.how!,
              style:  Theme.of(context).textTheme.headline6?.copyWith(
fontSize: 12.sp,
              color: MediaQuery.of(context).platformBrightness==Brightness.light?
                  Colors.grey[600]:Colors.grey[200]
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 130.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${recipeModel.likesCount!} likes",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                fontSize: 12.sp,
                              )),
                      Container(
                        height: 3.w,
                        width: 3.w,
                        decoration: BoxDecoration(
                          color: MediaQuery.of(context)
                              .platformBrightness ==
                              Brightness.light
                              ? Colors.grey[800]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                      Text("${recipeModel.comments!.length} Comments",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                fontSize: 12.sp,
                              )),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.green.shade400),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      side: MaterialStateProperty.all(
                        BorderSide(width: 2, color: Colors.green.shade400),
                      ),
                      fixedSize:
                          MaterialStateProperty.all(Size(73.w, 20.h))),
                  child: const Text("+ Save"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
