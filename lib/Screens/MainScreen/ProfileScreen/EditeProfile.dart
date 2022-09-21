import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scratchfood/API/profile_api_controller.dart';
import 'package:scratchfood/Screens/MainScreen/HomeScreen/MyRecipesScreen.dart';
import 'package:scratchfood/get/profile/profileGetxController.dart';
import 'package:scratchfood/model/api_response.dart';
import 'package:scratchfood/model/profile.dart';
import 'package:scratchfood/model/user.dart';
import 'package:scratchfood/util/context_extenssion.dart';

class EditeProfile extends StatefulWidget {
  final String name;
  final String email;
  final String bio;

  EditeProfile({required this.name, required this.email,required this.bio});

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  late TextEditingController _nametextEditingController;
  late TextEditingController _biotextEditingController;
  late TextEditingController _emailtextEditingController;
  late TextEditingController _phonetextEditingController;

  @override
  void initState() {
    _nametextEditingController = TextEditingController(text: widget.name);
    _biotextEditingController = TextEditingController(text: widget.bio);
    _emailtextEditingController = TextEditingController(text: widget.email);
    _phonetextEditingController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _nametextEditingController.dispose();
    _biotextEditingController.dispose();
    _emailtextEditingController.dispose();
    _phonetextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                controller: _nametextEditingController,
                decoration: InputDecoration(
                    label: AppText(
                        text: "Full Name",
                        color: Colors.grey,
                        fontSize: 14.sp)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 23.h),
              child: TextField(
                controller: _biotextEditingController,
                decoration: InputDecoration(
                    label: AppText(
                        text: "Bio", color: Colors.grey, fontSize: 14.sp)),
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
                controller: _emailtextEditingController,
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
                controller: _phonetextEditingController,
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
                onPressed: () async {
                  _performUpdateProfile();
                },
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

  void _performUpdateProfile() {
    if (_checkData()) {
      _updateProfile();
    }
  }

  bool _checkData() {
    if (_nametextEditingController.text != widget.name ||
        _emailtextEditingController.text != widget.email) {
      return true;
    }
    context.ShowSnackBar(
        message: 'please change your information', error: true);
    return false;
  }

  void _updateProfile() async {
    ApiResponse response =
        await ProfileGetxController.to.editProfile(newName: _nametextEditingController.text, newBio: _biotextEditingController.text,newEmail:_emailtextEditingController.text,newPhone: _phonetextEditingController.text);
     if(response.success){
       Navigator.pop(context);
     }
    context.ShowSnackBar(message: response.message, error: !response.success);
  }
}
