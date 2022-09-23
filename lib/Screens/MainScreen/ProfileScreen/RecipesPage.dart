import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scratchfood/get/profile/profileGetxController.dart';

import '../../../ShardDesgin/ShardWidget.dart';

class RecipesPage extends StatelessWidget {
  // ProfileGetxController controller=Get.put(ProfileGetxController());
  @override
  Widget build(BuildContext context) {
    return ProfileGetxController.to.userProfile.value.category!.isNotEmpty? GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.w,
        childAspectRatio: 1.05.h / .88.h,
        crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.h,
      ),
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 30.h),
      itemBuilder: (context, index) {
        return ShardProfileRepceItem(
          category:ProfileGetxController.to.userProfile.value.category![index],
          context: context,
          ImageUrl: 'assets/Image.jpg',
          MealName: 'Recs',
        );
      },
      itemCount: ProfileGetxController.to.userProfile.value.category!.length,
    ):Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.info,
          size: 55,
          color: Colors.grey.shade600,
        ),
        Text(
          'No Recipy',
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
