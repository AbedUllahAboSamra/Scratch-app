import 'package:get/get.dart';
import 'package:scratchfood/API/main_api_controller.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';
class MainController extends GetxController {
  late RxList recipeList=[].obs ;
  RxBool loading=false.obs;
  @override
  void onInit() {
    SharedPrefController().getValueFor<String>(PrefKeys.token.name)!=null?getRecipes():null;
    super.onInit();
  }


  MainApiController mainApiController = MainApiController();


  static MainController get to => Get.find() ;

  getRecipes() async{
    loading.value=true;
    recipeList.value = await mainApiController.getRecipes();
    loading.value=false;
  }
}
