
import 'category_model.dart';

class CategoryJson {
  String? message;
  CategoryModel? ctegory;
  int? status;

  CategoryJson({this.message, this.ctegory, this.status});

  CategoryJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    ctegory =
    json['Ctegory'] != null ? CategoryModel.fromJson(json['Ctegory']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (this.ctegory != null) {
      data['Ctegory'] = ctegory!.toJson();
    }
    data['status'] = status;
    return data;
  }
}