import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scratchfood/get/profile/profileGetxController.dart';

import '../../../ShardDesgin/ShardWidget.dart';

class FollowingPage extends StatelessWidget {
  ProfileGetxController controller = Get.put(ProfileGetxController());

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileGetxController>(
      builder: (controller) {
        return controller.loading.value
            ? CircularProgressIndicator()
            : controller.userProfile.value.category!.isNotEmpty
                ? Container(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) =>   ShardProfileUserDisgin(
                    follower: controller.following.value[index],
                        context: context),
                  separatorBuilder: (context, index) {
                    return Divider(indent: 20,endIndent: 20,);
                  },
                      itemCount: controller.following.value.length,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.info, size: 55, color: Colors.grey.shade500),
                      Text(
                        'No Data',
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  );

      },
    );
  }
}
