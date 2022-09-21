import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scratchfood/Screens/MainScreen/MainScreenController.dart';
import 'package:scratchfood/util/context_extenssion.dart';

import '../../API/add_api_controller.dart';
import '../../model/category_model.dart';

class AddController extends GetxController {
  static AddController get to => Get.find();

  RxList<CategoryModel>? categories ;

  final ImagePicker _picker = ImagePicker();
  File? categoryImage;
  File? recpyImage;
  List<File> imageFileList = [];
  RxList<TextEditingController> listAdditionalInfoControllers = [
    TextEditingController()
  ].obs;
  RxList<TextEditingController> listIngredientsInfoControllers = [
    TextEditingController()
  ].obs;

  picCategoryImage() async {
    categoryImage = null;
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (!image.isNull) {print(File(image!.path));
      categoryImage = File(image .path);
    update();

    }


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


  picRecpyImage() async {
    recpyImage = null;
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (!image.isNull) {print(File(image!.path));
    recpyImage = File(image .path);

    update();
    }
    update();

  }




  pickMultipleImage() async {
    imageFileList.clear();
    try {
      final images = await _picker.pickMultiImage(
          maxWidth: 600, maxHeight: 600, imageQuality: 50);
      if (images == null) return;
      for (XFile image in images) {
        var imagesTemporary = File(image.path);
        imageFileList .add(imagesTemporary);
      }
    } catch (e) {
   print(e);
    }

  }

  void addAdditionalInfo( ){

       listAdditionalInfoControllers.add(TextEditingController());

  }
  void addIngredientsInfo( ){
    listIngredientsInfoControllers.add(TextEditingController());
  }


  postRecipe({
    required String name,
    required String how,
    required CategoryModel categoryModel,
 }){
    var b = listIngredientsInfoControllers.length;
    var a = listAdditionalInfoControllers.length;
    if(listAdditionalInfoControllers[a].text.isNotEmpty&&listIngredientsInfoControllers[b].text.isNotEmpty &&recpyImage!=null

    ){
      List<String> ingredients=[];
      List<String> additional=[];

      listAdditionalInfoControllers.forEach((element) {
        additional.add(element.text);

      });
      listIngredientsInfoControllers.forEach((element) {
        ingredients.add(element.text);
      });

      AddApiController().
      postRecpy(
          categoryId: int.parse(categoryModel.id.toString()),
          name: name,
          image: recpyImage!,
          how: how,
          additional:additional,
          ingredients:ingredients,
          album:imageFileList );

    }

  }




  getCategoriesMethod() async{
    var a  = (await AddApiController().getCategories())!;
    categories!.value.addAll(a);
  }


}
