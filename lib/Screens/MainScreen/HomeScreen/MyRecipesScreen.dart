import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyRecipesSCreen extends StatelessWidget {
  const MyRecipesSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff363837),
        ),
        title: Text(
          'Back to My Profile',
          style: TextStyle(fontSize: 15.sp, color: Color(0xff767676)),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: Column(
            children: [
              Container(
                height: 32.h,
                width: 325.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'My Recipes',
                      color: Colors.black,
                      fontSize: 24.sp,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/add_recipes_screen');
                      },
                      child: Container(
                        height: 20.h,
                        width: 96.w,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(0xff30BE76),
                            ),
                            AppText(
                              text: 'Add New',
                              color: Color(0xff30BE76),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 50.h,
                width: 325.w,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 20.r,

                          // spreadRadius: 10,
                          offset: Offset(0, 6)),
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                          text: 'Western (5)',
                          color: Colors.black,
                          fontSize: 16.sp),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                // height: 350.h,
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RecipeItem();
                  },
                  itemCount: 3,
                ),
              )
            ],
          )),
    );
  }
}

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      height: 219.h,
      width: 325.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 20.r,

                // spreadRadius: 10,
                offset: Offset(0, 0)),
          ]),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r))),
              clipBehavior: Clip.antiAlias,
              width: 325.w,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      text: 'Cooked Coconut Mussels',
                      color: Colors.black,
                      fontSize: 18.sp),
                  SizedBox(
                    height: 19.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: AppText(
                            text: '5 mins',
                            color: Color(0xff606060),
                            fontSize: 14.sp),
                        height: 19.h,
                        width: 45.w,
                      ),
                      Container(
                        height: 4.h,
                        width: 4.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff979797)),
                      ),
                      Container(
                        height: 19.h,
                        child: AppText(
                            text: '4 ingredients',
                            color: Color(0xff606060),
                            fontSize: 13.sp),
                        width: 82.w,
                      ),
                      AppButton(
                          widget: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Color(0xff30BE76),
                          ),
                          AppText(
                              text: 'Cook',
                              fontWeight: FontWeight.bold,
                              color: Color(0xff30BE76),
                              fontSize: 14.sp)
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final Widget widget;
  AppButton({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 0,
            side: BorderSide(color: Color(0xff30BE76), width: 1.h)),
        onPressed: () {},
        child: widget);
  }
}

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  AppText({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.nunito(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ));
  }
}
