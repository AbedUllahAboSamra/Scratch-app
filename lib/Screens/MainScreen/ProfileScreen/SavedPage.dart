import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ShardDesgin/ShardWidget.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.w,
        childAspectRatio: 1.05.h / .88.h,
        crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.h,
      ),

      // physics: NeverScrollableScrollPhysics(),

      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        bottom: 10.h,
      ),

      itemBuilder: (context, index) => ShardProfileRepceItem(
          context: context, ImageUrl: 'assets/Image.jpg', MealName: 'Recs',),

      itemCount: 2,
    );
  }
}
