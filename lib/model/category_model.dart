
class CategoryModel {
  String? name;
  String? userId;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  CategoryModel(
      {this.name,
        this.userId,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}