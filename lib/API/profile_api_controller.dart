import 'dart:convert';
import 'dart:io';

import 'package:scratchfood/model/profile.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';
import '../model/follower.dart';
import '../util/api_helpers.dart';
import 'api_setting.dart';
import 'package:http/http.dart' as http;

class ProfileApiController {
  Future<Profile?>  getUserProfile({required int id})async{
      String token=SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
      Uri uri = Uri.parse(ApiSettings.PROFILE + '/?user_id=${id}');
      var response = await http.get(uri, headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:token
      });
      var json = jsonDecode(response.body) as List;
      if (response.statusCode == 200) {
        return json.map((e) {
        return  Profile.fromJson(e);
        },).toList().first;
      }else{
        return null;
   }
  }


  Future<List<Follower>>  getFollowers({required int id})async{
    String token=SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.FOLLOWRES + '/?user_id=${id}');
    print(uri);
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:token
    });
    var json = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return json.map((e) {
        return  Follower.fromJson(e);
      },).toList();
    }else{
      return [];
    }
  }

  Future<List<Follower>>  getFollowing({required int id})async{
    String token=SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.FOLLOWING + '/?user_id=${id}');
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:token
    });
    var json = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return json.map((e) {
        return  Follower.fromJson(e);
      },).toList();
    }else{
      return [];
    }
  }
}