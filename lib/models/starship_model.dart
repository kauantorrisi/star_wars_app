import 'dart:convert';

class StarshipModel {
  StarshipModel({
    required this.name,
  });

  final String name;

  factory StarshipModel.fromJson(String str) =>
      StarshipModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StarshipModel.fromMap(Map<String, dynamic> json) => StarshipModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
