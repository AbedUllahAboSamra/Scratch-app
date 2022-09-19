import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/Screens/MainScreen/HomeScreen/MyRecipesScreen.dart';

class EditeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 65.h, left: 25.w, right: 25.w),
        child: ListView(
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
                child: AppText(
                  text: "Edit Profile",
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              margin: EdgeInsets.only(top: 22.h),
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1579783483458-83d02161294e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=797&q=80"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: AppText(
                text: "Edit Profile Picture",
                color: Colors.green,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35.h),
              child: TextField(
                decoration: InputDecoration(
                    label: AppText(
                        text: "Full Name", color: Colors.grey, fontSize: 14.sp)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 23.h),
              child: TextField(
                decoration: InputDecoration(
                    label:
                        AppText(text: "Bio", color: Colors.grey, fontSize: 14.sp)),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 44.h),
              child: AppText(
                text: "Private Information",
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 11.h),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: AppText(
                    text: "Email",
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 11.h),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  label: AppText(
                    text: "Phone",
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            Container(
              height: 50.h,
              margin: EdgeInsets.only(top: 30.h),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: AppText(
                    text: "Save Profile",
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
