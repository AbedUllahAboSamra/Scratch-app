import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scratchfood/Screens/LoginAndCreeatAccount/LoginScreen.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';
import '../../../API/auth_api_controller.dart';
import '../../../SplitCode/ProviderSwitchUpdate.dart';
import '../../../model/api_response.dart';
import '../../../util/context_extenssion.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    bool NotifySwitch = Provider.of<ProviderSwitchUpdate>(context).NotifySwitch;
    bool messageSwitch =
        Provider.of<ProviderSwitchUpdate>(context).messageSwitch;
    bool liveCookingSwitch =
        Provider.of<ProviderSwitchUpdate>(context).liveCookingSwitch;
    bool seeSavedRecipesSwitch =
        Provider.of<ProviderSwitchUpdate>(context).seeSavedRecipesSwitch;
    bool seeProfilesSwitch =
        Provider.of<ProviderSwitchUpdate>(context).seeProfilesSwitch;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 25.w, top: 55.h, right: 25.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    print(SharedPrefController()
                        .getValueFor(PrefKeys.token.name)!);
                    ApiResponse response = await AuthApiController().logout();
                    if (response.success) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                      context.ShowSnackBar(
                          message: response.message, error: !response.success);
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.logout),
                      SizedBox(width: 5.w),
                      Text(
                        "Log Out",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15.h, bottom: 26.h),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 28.h),
              child: Text(
                "Push Notifications",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 31.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notify me for followers",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      activeColor: Colors.green,
                      thumbColor: Colors.white,
                      value: NotifySwitch,
                      onChanged: (value) {
                        Provider.of<ProviderSwitchUpdate>(context,
                                listen: false)
                            .updateNotifySwitch(value);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 31.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "When someone send me a message",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        activeColor: Colors.green,
                        thumbColor: Colors.white,
                        value: messageSwitch,
                        onChanged: (value) {
                          Provider.of<ProviderSwitchUpdate>(context,
                                  listen: false)
                              .updateMessageSwitch(value);
                        },
                      ),
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.only(bottom: 31.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "When someone do live cooking",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        activeColor: Colors.green,
                        thumbColor: Colors.white,
                        value: liveCookingSwitch,
                        onChanged: (value) {
                          Provider.of<ProviderSwitchUpdate>(context,
                                  listen: false)
                              .updateLiveCookingSwitch(value);
                        },
                      ),
                    ),
                  ],
                )),
            Container(
              height: 1,
              color: Colors.grey.shade400,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 28.h, top: 30.h),
              alignment: Alignment.centerLeft,
              child: Text(
                "Privacy Settings",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Followers can see my saved recipes",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      activeColor: Colors.green,
                      thumbColor: Colors.white,
                      value: seeSavedRecipesSwitch,
                      onChanged: (value) {
                        Provider.of<ProviderSwitchUpdate>(context,
                                listen: false)
                            .updateSeeSavedRecipesSwitch(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              margin: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Color(0xffE6E6E6),
              ),
              width: 325.w,
              height: 86.h,
              child: Text.rich(
                TextSpan(children: [
                  const TextSpan(
                      text:
                          "If disabled, you won’t be able to see recipes saved by other profiles. Leave this enabled to share your collected recipes to others. "),
                  TextSpan(
                      text: "why this matter?",
                      style: const TextStyle(color: Colors.green),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ]),
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 31.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Followers can see profiles I follow",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        activeColor: Colors.green,
                        thumbColor: Colors.white,
                        value: seeProfilesSwitch,
                        onChanged: (value) {
                          Provider.of<ProviderSwitchUpdate>(context,
                                  listen: false)
                              .updateSeeProfilesSwitch(value);
                        },
                      ),
                    ),
                  ],
                )),
            Container(
              height: 1,
              color: Colors.grey.shade400,
              margin: EdgeInsets.only(bottom: 31.h),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Change Password",
                  style: TextStyle(fontSize: 16.sp),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
              ],
            )
          ],
        ),
      ),
    );
  }
}
