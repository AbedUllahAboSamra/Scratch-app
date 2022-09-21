import 'category.dart';

class Profile {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? phone;
  String? bio;
  String? image;
  int? followCount;
  int? userCount;
  int? likesCount;
  int? ssssCount;
  List<Category>? category;

  Profile(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.phone,
        this.bio,
        this.image,
        this.followCount,
        this.userCount,
        this.likesCount,
        this.ssssCount,
        this.category});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phone = json['phone'];
    bio = json['bio'];
    image = json['image'];
    followCount = json['follow_count'];
    userCount = json['user_count'];
    likesCount = json['likes_count'];
    ssssCount = json['ssss_count'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phone'] = this.phone;
    data['bio'] = this.bio;
    data['image'] = this.image;
    data['follow_count'] = this.followCount;
    data['user_count'] = this.userCount;
    data['likes_count'] = this.likesCount;
    data['ssss_count'] = this.ssssCount;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

