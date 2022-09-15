import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ProviderSwitchUpdate extends ChangeNotifier {
  bool NotifySwitch = false;
  bool messageSwitch = true;
  bool liveCookingSwitch = true;
  bool seeSavedRecipesSwitch = true;
  bool seeProfilesSwitch = true;

//
  bool isVisibleSearchScreen = false;

//

  updateNotifySwitch(bool value) {
    NotifySwitch = value;
    notifyListeners();
  }

  updateMessageSwitch(bool value) {
    messageSwitch = value;
    notifyListeners();
  }

  updateLiveCookingSwitch(bool value) {
    liveCookingSwitch = value;
    notifyListeners();
  }

  updateSeeSavedRecipesSwitch(bool value) {
    seeSavedRecipesSwitch = value;
    notifyListeners();
  }

  updateSeeProfilesSwitch(bool value) {
    seeProfilesSwitch = value;
    notifyListeners();
  }

}
