import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/Screens/MainScreen/HomeScreen/MyRecipesScreen.dart';
import 'package:scratchfood/ShardDesgin/ShardWidget.dart';

class AddRecipeScreen extends StatefulWidget {
  AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  late TextEditingController nameRecipeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameRecipeController = TextEditingController();
  }

  @override
  void dispose() {
    nameRecipeController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Path customPath = Path()
    ..moveTo(20, 20)
    ..lineTo(50, 100)
    ..lineTo(20, 200)
    ..lineTo(100, 100)
    ..lineTo(20, 20);

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
          'Back to My Recipes',
          style: TextStyle(fontSize: 15.sp, color: Color(0xff767676)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'New Recipe',
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              // height: 65.h,
              // width: 324.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: DottedBorder(
                      color: Color(0xff979797),
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.round,
                      dashPattern: [8, 5],
                      radius: Radius.circular(8.r),
                      strokeWidth: 2,
                      child: Container(
                        height: 62.h,
                        width: 62.w,
                        child: Icon(Icons.add, color: Color(0xff363837)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            text: 'Recipe Name',
                            color: Color(0xffA8A8A8),
                            fontSize: 16.sp),
                        Container(
                          child: ShardTextFromFiled(
                              context: context,
                              lableText: 'Write Down Recipe Name',
                              hintText: '',
                              controller: nameRecipeController,
                              textInputType: TextInputType.name),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            DetailsForAddRecipe(
                title: 'Gallery', hint: 'Upload Images or Open Camera'),
            SizedBox(
              height: 20.h,
            ),
            DetailsForAddRecipe(title: 'Ingredients', hint: 'Add Ingredient'),
            SizedBox(
              height: 20.h,
            ),
            DetailsForAddRecipe(title: 'How to Cook', hint: 'Add Directions'),
            SizedBox(
              height: 20.h,
            ),
            DetailsForAddRecipe(title: 'Additional Info', hint: 'Add Info'),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 112.h,
              width: 325.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Save to',
                    color: Color(0xff606060),
                    fontSize: 14.sp,
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50.h,
                        width: 190.w,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 14.h),
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
                      AppButton(
                          widget: AppText(
                        text: 'Save Recipe',
                        color: Color(0xff30BE76),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ))
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: 325.w,
                decoration: BoxDecoration(
                    color: Color(0xffCCCCCC),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                  child: AppText(
                      text: 'Post to Feed',
                      color: Colors.white,
                      fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsForAddRecipe extends StatelessWidget {
  final String title;
  final String hint;

  DetailsForAddRecipe({Key? key, required this.title, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
      width: 325.w,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 20.r,
                offset: Offset(0, 0)),
          ],
          borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: title,
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                Icon(
                  Icons.edit_outlined,
                  color: Color(0xff363837),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          DottedBorder(
            color: Color(0xff979797),
            borderType: BorderType.RRect,
            strokeCap: StrokeCap.round,
            dashPattern: [8, 5],
            radius: Radius.circular(8.r),
            strokeWidth: 2,
            child: Container(
              height: 30.h,
              width: 295.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.w,
                    ),
                    AppText(
                        text: hint, color: Color(0xffA8A8A8), fontSize: 16.sp)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
