import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 65.h, left: 25.w, right: 25.w),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Text("Back to Profile"),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 15.h),
                child: const Text("Edit Profile")),
            Container(
              margin: EdgeInsets.only(),
              child: Image.asset(""),
            )
          ],
        ),
      ),
    );
  }
}
