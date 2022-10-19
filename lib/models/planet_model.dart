import 'dart:convert';

class PlanetModel {
  PlanetModel({
    required this.name,
    required this.diameter,
    required this.terrain,
  });

  final String name;
  final String diameter;
  final String terrain;

  factory PlanetModel.fromJson(String str) =>
      PlanetModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlanetModel.fromMap(Map<String, dynamic> json) => PlanetModel(
        name: json["name"],
        diameter: json["diameter"],
        terrain: json["terrain"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "diameter": diameter,
        "terrain": terrain,
      };
}
