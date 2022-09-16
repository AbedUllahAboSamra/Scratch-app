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
  Future<ApiResponse> login(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.LOGIN);
    print(email);
    print(password);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    });
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(json);
      print(user.token);

      SharedPrefController().save(user);
      return ApiResponse(message: 'logged Successfully', success: true);
    } else if (response.statusCode == 422) {
      return ApiResponse(message: json['message'], success: false);
    } else if (response.statusCode == 401) {
      return ApiResponse(message: json['massage'], success: false);
    } else {
      return errorResponse;
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
          message: json['message'],
          success: json['status'].toString() == '200');
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

    if (response.statusCode == 200 || response.statusCode == 401) {
      var json = jsonDecode(response.body);
      SharedPrefController().clear();
      return ApiResponse(
          message: json['message'],
          success: json['status'].toString() == '200');
    }
    SharedPrefController().clear();

    return errorResponse;
  }

}
