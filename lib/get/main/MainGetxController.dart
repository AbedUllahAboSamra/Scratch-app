import 'package:get/get.dart';
import 'package:scratchfood/API/main_api_controller.dart';
class MainController extends GetxController {
  late RxList recipeList=[].obs ;
  RxBool loading=false.obs;
  @override
  void onInit() {
    getRecipes();
    super.onInit();
  }


  MainApiController mainApiController = MainApiController();


  static MainController get to => Get.find() ;

  getRecipes() async{
    loading.value=true;
    recipeList.value = await mainApiController.getRecipes();
    loading.value=false;
    update();
  }
}
