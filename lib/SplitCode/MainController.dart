import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scratchfood/API/main_api_controller.dart';
import 'package:scratchfood/model/recipe.dart';

class MainController extends GetxController {
  late RxList recipeList=[].obs ;


  MainApiController mainApiController = MainApiController();


  static MainController get to => Get.find() ;



  getRecipes() async{
    recipeList.clear();
    print('انا اشتغلت  ي جدعان');

    recipeList.value = await mainApiController.getRecipes();

    update();
  }












}
