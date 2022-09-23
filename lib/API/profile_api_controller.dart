import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/EditeProfile.dart';
import 'package:scratchfood/model/api_response.dart';
import 'package:scratchfood/model/profile.dart';
import 'package:scratchfood/model/user.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';
import '../model/follower.dart';
import '../util/api_helpers.dart';
import 'api_setting.dart';
import 'package:http/http.dart' as http;

class ProfileApiController  with ApiHelpers {
  Future<Profile?> getUserProfile({required int id,}) async {

    String token = SharedPrefController().getValueFor<String>(
        PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.PROFILE + '/?user_id=${id}');
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: token
    });
    var json = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return json.map((e) {
        print(e);
              return Profile.fromJson(e);
      },)
          .toList()
          .first;
    } else {
      return null;
    }
  }


  Future<List<Follower>> getFollowers({required int id}) async {
    String token = SharedPrefController().getValueFor<String>(
        PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.FOLLOWRES + '/?user_id=${id}');
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: token
    });
    var json = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return json.map((e) {
        return Follower.fromJson(e);
      },).toList();
    } else {
      return [];
    }
  }

  Future<List<Follower>> getFollowing({required int id}) async {
    String token = SharedPrefController().getValueFor<String>(
        PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.FOLLOWING + '/?user_id=${id}');
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: token
    });
    var json = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return json.map((e) {
        return Follower.fromJson(e);
      },).toList();
    } else {
      return [];
    }
  }


  Future<ApiResponse<User>> editeProfile(
      {required String name, required String bio, required String email, required String phone}) async {
    String token = SharedPrefController().getValueFor<String>(
        PrefKeys.token.name)!;
    String id = SharedPrefController().getValueFor<String>(PrefKeys.id.name)!;
    Uri uri = Uri.parse(ApiSettings.EDITPROFILE);
    var response = await http.post(uri,
        body: {
          'email': email,
          // 'phone': phone,
          'bio': bio,
          'name': name,
          'user_id': id
        },
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: token
        });
    var json = jsonDecode(response.body);
    if (response.statusCode == 200 ) {
      return ApiResponse<User>(
        json['message'], json['status'].toString() == '201',
        User.fromJson(json['user']),);
    }else if( response.statusCode == 422){
      return ApiResponse(json['message'], json['status'].toString() == '201');
    } else {
      return ApiResponse('something went error',false);
    }
  }
}