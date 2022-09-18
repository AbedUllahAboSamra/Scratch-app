import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scratchfood/get/profile/profileGetxController.dart';

import '../../../ShardDesgin/ShardWidget.dart';

class RecipesPage extends StatelessWidget {
  ProfileGetxController controller=Get.put(ProfileGetxController());
  @override
  Widget build(BuildContext context) {
    return GetX<ProfileGetxController>(
      builder: (controller) {
        return controller.loading.value?CircularProgressIndicator():controller.userProfile.value.category!.isNotEmpty? GridView.builder(
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
              category:controller.userProfile.value.category![index],
            context: context,
            ImageUrl: 'assets/Image.jpg',
            MealName: 'Recs',
          );
          },
          itemCount: controller.userProfile.value.category!.length,
        ):Column(mainAxisAlignment: MainAxisAlignment.end,children: [Icon(Icons.info,size: 55,color: Colors.grey.shade500),Text('No Data',style: Theme.of(context).textTheme.headline2,)],);
      },

    );
  }
}
