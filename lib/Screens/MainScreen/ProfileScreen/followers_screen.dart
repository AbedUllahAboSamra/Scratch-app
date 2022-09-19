import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scratchfood/ShardDesgin/ShardWidget.dart';
import 'package:scratchfood/get/profile/profileGetxController.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';

class FollowersScreen extends StatefulWidget {
  FollowersScreen({Key? key}) : super(key: key);
  static String ScreenNamed = '/followers_screen';


  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  ProfileGetxController controller = Get.put(ProfileGetxController());
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),() {
      controller.getFollowers(id: int.parse(SharedPrefController().getValueFor(PrefKeys.id.name)));
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Followers',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetX<ProfileGetxController>(
        builder: (controller) {
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : controller.followers.value.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ShardProfileUserDisgin(
                            follower: controller.followers.value[index],
                              context: context);
                        },
                        itemCount: controller.followers.value.length,
                      ),
                    )
                  : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info, size: 55, color: Colors.grey.shade500),
                          Text(
                            'No Followers',
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                  );
          ;
        },
      ),
    );
  }
}
