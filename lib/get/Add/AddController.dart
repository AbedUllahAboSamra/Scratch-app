import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scratchfood/Screens/MainScreen/MainScreenController.dart';

import '../../API/add_api_controller.dart';

class AddController extends GetxController {
  static AddController get to => Get.find();

  final ImagePicker _picker = ImagePicker();

  File? categoryImage;

  picCategoryImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (!image.isNull) {
      categoryImage = File(image!.path);
    }
    update();
  }

  void postCategory({
    required File image,
    required String name,
    required BuildContext context,
  }) async {
    var a = await AddApiController().postCategory(name: name, image: image);

    if (a == 200) {
      Navigator.pushReplacementNamed(
          context, MainScreenController.mainScreenNamed);
    }

    update();
  }
}
