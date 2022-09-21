import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:scratchfood/API/api_setting.dart';
import 'package:scratchfood/model/user.dart';
import 'package:scratchfood/model/user_model.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';

import '../model/api_response.dart';
import '../util/api_helpers.dart';

class AuthApiController with ApiHelpers {
  Future<ApiResponse<User>> login(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.LOGIN);

    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    });
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(json);

      SharedPrefController().save(user);
      return ApiResponse<User>( 'logged Successfully', true,user.user);
    } else if (response.statusCode == 422) {
      return ApiResponse( json['message'],  false);
    } else if (response.statusCode == 401) {
      return ApiResponse( json['massage'],  false);
    } else {
      return ApiResponse( 'something went wrong , try again', false);
    }
  }

  Future<ApiResponse> register(
      {required String email,
      required String password,
      required String name}) async {
    Uri uri = Uri.parse(ApiSettings.REGISTER);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
      'name': name,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 422) {
      var json = jsonDecode(response.body);
      return ApiResponse(
          json['message'],
           json['status'].toString() == '200');
    }

    return errorResponse;
  }

  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.LOGOUT);
    String token =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    var response = await http.delete(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      SharedPrefController().clear();
      return ApiResponse(
           json['message'],
           json['status'].toString() == '200');
    }
    SharedPrefController().clear();

    return errorResponse;
  }

}
