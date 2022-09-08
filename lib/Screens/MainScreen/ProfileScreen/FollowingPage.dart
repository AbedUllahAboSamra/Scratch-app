import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ShardDesgin/ShardWidget.dart';

class FollowingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) => ShardProfileUserDisgin(
            ImageUrl: 'assets/Image.jpg',
            context: context,
            MealName: 'abod Ayman'),
        separatorBuilder: (ctx, index) => SizedBox(
          height: 4.h,
        ),
        itemCount: 5,

      ),
    );
  }
}
