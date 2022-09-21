

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scratchfood/util/context_extenssion.dart';
import '../../../ShardDesgin/ShardWidget.dart';
import '../../../get/Add/AddController.dart';
import '../HomeScreen/MyRecipesScreen.dart';

class AddCategoryScreen extends StatefulWidget {
  static String screenNamed = '/AddCategoryScreen';

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
var controller = Get.put<AddController>(AddController());

var categoryNameController = TextEditingController();

var notNull = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed:(){
        Navigator.pop(context);
        },
          icon:Icon( Icons.arrow_back_ios),
          color: Color(0xff363837),
        ),
        title: Text(
          'Back to My Recipes',
          style: TextStyle(fontSize: 15.sp, color: Color(0xff767676)),
        ),
      ),
      body: GetBuilder<AddController>(
        builder: (controller){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'New Category',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 30.h,
                ),
                InkWell(
                  onTap: (){
                  controller.picCategoryImage();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 300.h,
                    child: DottedBorder(
                      color: Color(0xff979797),
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.round,
                      dashPattern: [8, 5],
                      radius: Radius.circular(8.r),
                      strokeWidth: 2,
                      child: controller.categoryImage==null ? Center(
                        child: Container(
                          height: 120.h,
                          width: 120.w,
                          child: Icon(Icons.add_rounded ,size: 50,),
                        ),
                      ):Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(8.r)
                        ),
                        child: Image.file(controller.categoryImage!,
                        fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                text: 'Category name',
                                color: const Color(0xffA8A8A8),
                                fontSize: 16.sp),
                            Container(
                              child: ShardTextFromFiled(
                                  context: context,
                                  lableText: '',
                                  hintText: '',
                                  onChange : (a){
                                    if(a.length>=3){
                                      notNull =true;
                                    }else{
                                      notNull =false;

                                    }
                                  },
                                  controller: categoryNameController,
                                  textInputType: TextInputType.name),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 30.h,),
                InkWell(

                  onTap: notNull?() {
                    if(controller.categoryImage!=null){
                      controller.postCategory(image: controller.categoryImage!, name: categoryNameController.text, context: context);
                    }else{
                      context.ShowSnackBar(message: 'Enter Required Data', error: true);
                    }

                  }:null,

                  child: Container(
                    height: 50.h,
                    width: 325.w,
                    decoration: BoxDecoration(
                        color: Color(0xffCCCCCC),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Center(
                      child: AppText(
                          text: 'Post Category',
                          color: Colors.white,
                          fontSize: 16.sp),
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
