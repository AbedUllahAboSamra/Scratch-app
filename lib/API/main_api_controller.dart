
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:scratchfood/model/recipe.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';

import '../util/api_helpers.dart';
import 'api_setting.dart';

import 'package:http/http.dart' as http;
class MainApiController   {

  Future<List<RecipeModel>> getRecipes() async {

    String token=SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiSettings.GETRECPY);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200 || response.statusCode == 422) {
      var json = jsonDecode(response.body) as List;
print(json.toString());
return json.map((e) {
 return RecipeModel.fromJson(e);
}).toList();


    }
return[];
    }

}