// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scratchfood/Screens/MainScreen/HomeScreen/MyRecipesScreen.dart';
import 'package:scratchfood/ShardDesgin/ShardWidget.dart';
import 'package:scratchfood/get/Add/AddController.dart';
import 'package:scratchfood/model/category.dart';
import 'package:scratchfood/util/context_extenssion.dart';

import '../../../get/profile/profileGetxController.dart';

class AddRecipeScreen extends StatefulWidget {
  static String screenNamed = '/add_recipe_screen';

  AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  late TextEditingController nameRecipeController;
  late TextEditingController howRecipeController;
  var controller = Get.put<AddController>(AddController());
  var controller2 = Get.put<ProfileGetxController>(ProfileGetxController());

  Category?  selectval ;

  @override
  void initState() {
    super.initState();
    nameRecipeController = TextEditingController();
    howRecipeController = TextEditingController();
    controller.recpyImage=null;
    controller.imageFileList=[];
     controller.listAdditionalInfoControllers.value=[TextEditingController()];
     controller.listIngredientsInfoControllers.value=[TextEditingController()];
 selectval = controller2.userProfile.value.category![0];

   }
  @override
  void dispose() {
    nameRecipeController.dispose();
    howRecipeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff363837),
        ),
        title: Text(
          'Back to My Recipes',
          style: TextStyle(fontSize: 15.sp, color: Color(0xff767676)),
        ),
      ),
      body: GetX<AddController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
            child: ListView(
              physics: BouncingScrollPhysics(),
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
                        child: InkWell(
                          onTap: () {
                            controller.picRecpyImage();
                          },
                          child: Container(
                            width: 90.h,
                            height: 90.h,
                            child: DottedBorder(
                              color: Color(0xff979797),
                              borderType: BorderType.RRect,
                              strokeCap: StrokeCap.round,
                              dashPattern: [8, 5],
                              radius: Radius.circular(8.r),
                              strokeWidth: 2,
                              child: controller.recpyImage == null
                                  ? Center(
                                      child: Container(
                                        height: 120.h,
                                        width: 120.w,
                                        child: Icon(
                                          Icons.add_rounded,
                                          size: 50,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Image.file(
                                        controller.recpyImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
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
                SizedBox(
                  height: 30.h,
                ),

                Container(
                  width: double.infinity,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: 'Gallery',
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
                      InkWell(
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          controller.pickMultipleImage();
                        },
                        child: DottedBorder(
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
                                      text: 'Upload Images or Open Camera',
                                      color: Color(0xffA8A8A8),
                                      fontSize: 16.sp)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.h,
                        child: Row(
                          children: controller.imageFileList.map((e) {
                            return Container(
                              height: 40.h,
                              width: 40.h,
                              child: Image.file(e),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.white
                          : Colors.black87,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: "Additional Info",
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
                      Column(children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller
                                .listIngredientsInfoControllers.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                  height: 32.h,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: 10.w, right: 10.w, bottom: 12.h),
                                  child: Center(
                                    child:  Dismissible(
                                      confirmDismiss:
                                          (DismissDirection direction) async {
                                        return index == 0 ? false : true;
                                      },
                                      direction: DismissDirection.endToStart,
                                      background: Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.only(left: 20.w),
                                        color: Colors.red[600],
                                        child: Icon(Icons.delete_outline,
                                          color: Colors.white,),
                                      ),
                                      onDismissed: (i) {
                                        if (index != 0) {
                                          controller
                                              .removeIngredientsInfo(index);
                                        }
                                      },
                                      key: GlobalKey(),
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
                                            top: 12.h,
                                          ),
                                          child: TextFormField(
                                            controller: controller
                                                    .listIngredientsInfoControllers[
                                                index],
                                            decoration: InputDecoration(
                                                hintText:
                                                    'Ingredient ${index + 1}',
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .headline6),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            if (controller
                                .listIngredientsInfoControllers[controller
                                        .listIngredientsInfoControllers.length -
                                    1]
                                .text
                                .isNotEmpty) {
                              controller.addIngredientsInfo();
                            } else {
                              context.ShowSnackBar(
                                  message: 'Cannot be Empty', error: true);
                            }
                          },
                          child: Container(
                              height: 30.h,
                              width: 295.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    AppText(
                                        text: "add",
                                        color: Color(0xffA8A8A8),
                                        fontSize: 16.sp)
                                  ],
                                ),
                              )),
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: 'How to Cook',
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
                          padding: EdgeInsets.only(top: 12.h),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: TextFormField(
                              controller: howRecipeController,
                              decoration: InputDecoration(
                                  hintText: 'Add your plain',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle:
                                      Theme.of(context).textTheme.headline6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                //asdsd
                // +
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.white
                          : Colors.black87,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: "Additional Info",
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
                      Column(children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                controller.listAdditionalInfoControllers.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                  height: 32.h,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: 10.w, right: 10.w, bottom: 12.h),
                                  child: Dismissible(
                                      confirmDismiss:
                                          (DismissDirection direction) async {
                                        return index == 0 ? false : true;
                                      },
                                      direction: DismissDirection.endToStart,
                                      background: Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.only(left: 20.w),
                                        color: Colors.red[600],
                                        child: Icon(Icons.delete_outline,
                                        color: Colors.white,),
                                      ),
                                      onDismissed: (i) {
                                        if (index != 0) {
                                          controller
                                              .removeAdditionalInfo(index);
                                        }
                                      },
                                      key: GlobalKey(),
                                      child: Center(
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
                                              top: 12.h,
                                            ),
                                            child: TextFormField(
                                              controller: controller
                                                      .listAdditionalInfoControllers[
                                                  index],
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Additional ${index + 1}',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline6),
                                            ),
                                          ),
                                        ),
                                      )));
                            }),
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print(controller
                                    .listAdditionalInfoControllers[controller
                                            .listAdditionalInfoControllers
                                            .length -
                                        1]
                                    .text +
                                "ASDASDaASD");
                            if (controller
                                .listAdditionalInfoControllers[controller
                                        .listAdditionalInfoControllers.length -
                                    1]
                                .text
                                .isNotEmpty) {
                              controller.addAdditionalInfo();
                            } else {
                              context.ShowSnackBar(
                                  message: 'Cannot be Empty', error: true);
                            }
                          },
                          child: Container(
                              height: 30.h,
                              width: 295.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    AppText(
                                        text: "add",
                                        color: Color(0xffA8A8A8),
                                        fontSize: 16.sp)
                                  ],
                                ),
                              )),
                        ),
                      ]),
                    ],
                  ),
                ),
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
                              child:   DropdownButton(
                                underline: Container(),
                                value: selectval,
                                onChanged: (value){
                                  setState(() {
                                    selectval = value as Category;
                                    print(selectval);
                                  });
                                },
                                items: controller2.userProfile.value.category!.map((itemone){
                                  return DropdownMenuItem(
                                      value: itemone,
                                      child: Text(itemone.name.toString())
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          AppButton(
                              widget: AppText(
                            text: 'Save Recipe',
                            color: Color(0xff30BE76),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),



                          )
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h,),
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    print('asdasdasd');
                    print(selectval!.id!.toString());
                    controller.postRecipe(
                      context: context,
                      id: selectval!.id!,
                      how: howRecipeController.text,
                      name: nameRecipeController.text

                    );

                  },
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
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],

            ),
          );
        },
      ),
    );
  }
}
