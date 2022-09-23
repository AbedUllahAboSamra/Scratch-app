import 'package:get/get.dart';
import 'package:scratchfood/API/main_api_controller.dart';
import 'package:scratchfood/model/api_response.dart';
import 'package:scratchfood/model/comment.dart';
import 'package:scratchfood/model/recipe.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';
class MainController extends GetxController {
   RxList<RecipeModel> recipeList=<RecipeModel>[].obs ;
   Rx<Comments> comments=Comments().obs;
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

  Future<ApiResponse> addComment({required String recipe_id,required String comment}) async{
    loading.value=true;
    ApiResponse<Comments> apiResponse = await mainApiController.addComment(recipe_id: recipe_id, comment: comment);
    comments.value=apiResponse.object!;
    loading.value=false;
    return apiResponse;
  }
}
