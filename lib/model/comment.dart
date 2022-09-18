
class Comments {
  int? id;
  int? userId;
  int? recipeId;
  String? createdAt;
  String? updatedAt;
  String? comment;

  Comments(
      {this.id,
        this.userId,
        this.recipeId,
        this.createdAt,
        this.updatedAt,
        this.comment});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    recipeId = json['recipe_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['recipe_id'] = this.recipeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['comment'] = this.comment;
    return data;
  }
}
