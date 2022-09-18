import 'package:flutter/cupertino.dart';
import 'package:scratchfood/API/main_api_controller.dart';
import 'package:scratchfood/model/recipe.dart';

class ProviderMainController extends ChangeNotifier {
  List<RecipeModel> recipeList = [];

  MainApiController mainApiController = MainApiController();

  getRecipes() async {
    print('انا اشتغلت  ي جدعان');

    recipeList = await mainApiController.getRecipes();

    notifyListeners();
  }
}
