import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:scratchfood/model/api_response.dart';
import 'package:scratchfood/model/comment.dart';
import 'package:scratchfood/model/recipe.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';

import '../util/api_helpers.dart';
import 'api_setting.dart';

import 'package:http/http.dart' as http;

class MainApiController {
  Future<List<RecipeModel>> getRecipes() async {
    String token =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiSettings.GETRECPY);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'
    });


    print('************');
    print(response.body);
    print('************');
    if (response.statusCode == 200 || response.statusCode == 422) {
      var json = jsonDecode(response.body) as List;
      print(json.toString());
      return json.map((e) {
        return RecipeModel.fromJson(e);
      }).toList();
    }
    return [];
  }

  Future<ApiResponse<Comments>> addComment({required String recipe_id,required String comment}) async {
    String token =
    SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiSettings.COMMENT_POST);
    var response = await http.post(uri,
        body: {
        'recipe_id':recipe_id,
        'user_id':SharedPrefController().getValueFor<String>(PrefKeys.id.name)!,
        'comment':comment
        },

        headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200 || response.statusCode == 422) {
      var json = jsonDecode(response.body);
      return ApiResponse<Comments>(json['message'], json['status'].toString()=='200',Comments.fromJson(json['comment']));
    }
    return ApiResponse('something went error', false);
  }

}
