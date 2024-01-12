import 'dart:convert';

class DropdownModel {
  final int id;
  final String name;

  DropdownModel({required this.id, required this.name});

  factory DropdownModel.fromRawJson(String str) =>
      DropdownModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DropdownModel.fromJson(Map<String, dynamic> json) => DropdownModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
