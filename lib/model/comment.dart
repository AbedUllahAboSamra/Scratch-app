class Comments {
  String? nameUser;
  int? id;
  int? userId;
  dynamic? recipeId;
  String? createdAt;
  String? updatedAt;
  String? comment;

  Comments(
      {this.nameUser,
        this.id,
        this.userId,
        this.recipeId,
        this.createdAt,
        this.updatedAt,
        this.comment});

  Comments.fromJson(Map<String, dynamic> json) {
    nameUser = json['nameUser'];
    id = json['id'];
    userId = json['user_id'];
    recipeId = json['recipe_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameUser'] = this.nameUser;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['recipe_id'] = this.recipeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['comment'] = this.comment;
    return data;
  }
}