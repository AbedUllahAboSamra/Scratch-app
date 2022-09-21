import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:http/http.dart' as http;
import 'package:scratchfood/API/api_setting.dart';
import 'package:scratchfood/model/category_model.dart';
import 'package:scratchfood/prefs/shared_pref_controller.dart';

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
      HttpHeaders.authorizationHeader: token
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

  Future<int?> postRecpy({
    required int categoryId,
    required String name,
    required File image,
    required String how,
    required List<String> additional,
    required List<String> ingredients,
    required List<File>? album,
  }) async {
    String token =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.POST_RECPY);

    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: token
    };
    request.headers.addAll(headers);

    List<http.MultipartFile> newList = <http.MultipartFile>[];
    for (var i in album!) {
      http.MultipartFile path =
          await http.MultipartFile.fromPath('album', i.path);
      newList.add(path);
    }
    request.files.addAll(newList);
    var path = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(path);
    // request.fields['how']=how;
    // request.fields['name']=name;
    // request.fields['ingredients']=jsonEncode(ingredients);
    // request.fields['additional']=jsonEncode(additional);
    // request.fields['Category_id']=categoryId.toString();

    request.fields.addAll({
      "how": how,
      "name": name,
      "ingredients": jsonEncode(ingredients),
      "additional": jsonEncode(additional),
      "Category_id": categoryId.toString(),
    });

    var res = await request.send();
    String data = await res.stream.transform(utf8.decoder).first;
    print(data);
    print("asdsadasd" + res.statusCode.toString());
    if (res.statusCode == 200) {
      var json = jsonDecode(data);
      return 200;
    }
//--
  }

  Future<List<CategoryModel>?> getCategories() async {
    String token =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.CATEGORY_GET);

    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: token,
    });
    var json = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return json.map((e) => CategoryModel.fromJson(e)).toList();
    }
  }
}
