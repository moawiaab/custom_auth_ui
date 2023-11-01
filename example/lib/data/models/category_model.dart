import 'dart:convert';

class CategoryModel {
  final List<Category> category;
  final List<dynamic> productModel;

  CategoryModel({
    required this.category,
    required this.productModel,
  });

  factory CategoryModel.fromRawJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        category: List<Category>.from(
            json["Category"].map((x) => Category.fromJson(x))),
        productModel: List<dynamic>.from(json["ProductModel"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Category": List<dynamic>.from(category.map((x) => x.toJson())),
        "ProductModel": List<dynamic>.from(productModel.map((x) => x)),
      };
}

class Category {
  final int id;
  final String name;
  final String user;
  final String details;
  final String status;
  final String createdAt;
  final String deletedAt;

  Category({
    required this.id,
    required this.name,
    required this.user,
    required this.details,
    required this.status,
    required this.createdAt,
    required this.deletedAt,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        user: json["user"],
        details: json["details"],
        status: json["status"],
        createdAt: json["created_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user": user,
        "details": details,
        "status": status,
        "created_at": createdAt,
        "deleted_at": deletedAt,
      };
}
