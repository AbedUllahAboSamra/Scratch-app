import 'package:get/get.dart';
import 'package:scratchfood/API/main_api_controller.dart';
import 'package:scratchfood/API/profile_api_controller.dart';
import 'package:scratchfood/model/profile.dart';

import '../../model/follower.dart';
class ProfileGetxController extends GetxController {
   Rx<Profile> userProfile=Profile().obs;
   RxList<Follower>followers=<Follower>[].obs;
   RxList<Follower>following=<Follower>[].obs;
  RxBool loading=false.obs;


  ProfileApiController profileApiController =ProfileApiController();


  static ProfileGetxController get to => Get.find() ;

  getUserProfile({required int id}) async{
    loading.value=true;
    userProfile.value = (await profileApiController.getUserProfile(id: id))!;
    loading.value=false;
  }

  getFollowers({required int id}) async{
    print(id);
    loading.value=true;
    followers.value = (await profileApiController.getFollowers(id: id));
    loading.value=false;
  }
  getFollowing({required int id}) async{
    print(id);
    loading.value=true;
    following.value = (await profileApiController.getFollowing(id: id));
    loading.value=false;
  }
}
