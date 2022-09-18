import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SettingController extends GetxController {
  bool NotifySwitch = false;
  bool messageSwitch = true;
  bool liveCookingSwitch = true;
  bool seeSavedRecipesSwitch = true;
  bool seeProfilesSwitch = true;

//
  bool isVisibleSearchScreen = false;

//
  static SettingController get to => Get.find() ;

  updateNotifySwitch(bool value) {
    NotifySwitch = value;
    update();
  }

  updateMessageSwitch(bool value) {
    messageSwitch = value;
    update();
  }

  updateLiveCookingSwitch(bool value) {
    liveCookingSwitch = value;
    update();
  }

  updateSeeSavedRecipesSwitch(bool value) {
    seeSavedRecipesSwitch = value;
    update();
  }

  updateSeeProfilesSwitch(bool value) {
    seeProfilesSwitch = value;
    update();
  }

}
