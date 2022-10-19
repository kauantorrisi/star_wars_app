import 'dart:convert';

class FilmModel {
  FilmModel({
    required this.title,
    required this.director,
    required this.created,
    required this.producer,
  });

  final String title;
  final String director;
  final String created;
  final String producer;

  factory FilmModel.fromJson(String str) => FilmModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FilmModel.fromMap(Map<String, dynamic> json) => FilmModel(
        title: json["title"],
        director: json["director"],
        created: json["created"],
        producer: json["producer"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "director": director,
        "created": created,
        "producer": producer,
      };
}
