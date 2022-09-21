import 'package:get/get.dart';
import 'package:scratchfood/API/main_api_controller.dart';
import 'package:scratchfood/API/profile_api_controller.dart';
import 'package:scratchfood/model/api_response.dart';
import 'package:scratchfood/model/profile.dart';
import 'package:scratchfood/model/user.dart';
import 'package:scratchfood/model/user_model.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';

import '../../model/follower.dart';
class ProfileGetxController extends GetxController {
   Rx<Profile> userProfile=Profile().obs;
   RxList<Follower>followers=<Follower>[].obs;
   RxList<Follower>following=<Follower>[].obs;
   Rx<User> user=User().obs;
  RxBool loading=false.obs;


  ProfileApiController profileApiController =ProfileApiController();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  static ProfileGetxController get to => Get.find() ;

  getUserProfile({required int id}) async{
    loading.value=true;
    userProfile.value = (await profileApiController.getUserProfile(id: id))!;
    loading.value=false;
  }

  getFollowers({required int id}) async{
    loading.value=true;
    followers.value = (await profileApiController.getFollowers(id: id));
    loading.value=false;
  }
  getFollowing({required int id}) async{
    loading.value=true;
    following.value = (await profileApiController.getFollowing(id: id));
    loading.value=false;
  }

  Future<ApiResponse<User>> editProfile({required String newName,required String newBio,required String newEmail,required String newPhone})async {
    loading.value=true;
    ApiResponse<User> apiResponse=await profileApiController.editeProfile(name: newName,bio: newBio, email: newEmail, phone: newPhone);
    print(apiResponse.message);
    if(apiResponse.object!=null){
      userProfile.value.name = apiResponse.object!.name;
      userProfile.value.bio= apiResponse.object!.bio;
      userProfile.value.email= apiResponse.object!.email;
      userProfile.value.phone= apiResponse.object!.phone;
    loading.value=false;
    }

    loading.value=false;
    return apiResponse;
  }
}
