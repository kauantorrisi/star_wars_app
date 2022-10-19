import 'dart:convert';

class PersonModel {
  PersonModel({
    required this.name,
    required this.gender,
    required this.birthYear,
    required this.homeworld,
    required this.starships,
    required this.films,
  });

  final String name;
  final String gender;
  final String birthYear;
  final String homeworld;
  final List<String> starships;
  final List<String> films;

  factory PersonModel.fromJson(String str) =>
      PersonModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PersonModel.fromMap(Map<String, dynamic> json) => PersonModel(
        name: json["name"],
        gender: json["gender"],
        birthYear: json["birth_year"],
        homeworld: json["homeworld"],
        starships: List<String>.from(json["starships"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "gender": gender,
        "birth_year": birthYear,
        "homeworld": homeworld,
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "films": List<dynamic>.from(films.map((x) => x)),
      };
}
