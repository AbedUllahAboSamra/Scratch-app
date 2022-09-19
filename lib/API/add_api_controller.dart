import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:scratchfood/API/api_setting.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';

import '../model/category_json.dart';

class AddApiController {

  //--
  Future<int?> postCategory({
    required String name,
    required File image,
  }) async {
    String token =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.CATEGORY_POST);

    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          token
    };
    request.headers.addAll(headers);
    var path = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(path);
    request.fields.addAll({
      "name": name,
    });
    var res = await request.send();
    print('asdasd ${res.statusCode}');
    if (res.statusCode == 200) {
      return 200;
    }
  }
  //--




}
