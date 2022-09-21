
import 'comment.dart';

class RecipeModel {
  String? nameUser;
  int? id;
  int? categoryId;
  String? name;
  String? image;
  String? how;
  List<String>? additional;
  String? createdAt;
  String? updatedAt;
  int? userId;
  List<String>? ingredients;
  List<String>? album;
  int? likesCount;
  List<Comments>? comments;

  RecipeModel(
      {this.nameUser,
        this.id,
        this.categoryId,
        this.name,
        this.image,
        this.how,
        this.additional,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.ingredients,
        this.album,
        this.likesCount,
        this.comments});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    nameUser = json['nameUser'];
    id = json['id'];
    categoryId = json['Category_id'];
    name = json['name'];
    image = json['image'];
    how = json['how'];
    additional = json['additional'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    ingredients = json['ingredients'].cast<String>();
    album = json['album'].cast<String>();
    likesCount = json['likes_count'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameUser'] = this.nameUser;
    data['id'] = this.id;
    data['Category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['how'] = this.how;
    data['additional'] = this.additional;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['ingredients'] = this.ingredients;
    data['album'] = this.album;
    data['likes_count'] = this.likesCount;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}