import 'dart:async';
import 'package:dio/dio.dart';
import 'package:star_wars_app/common/constants.dart';
import '../models/film_model.dart';

class FilmService {
  final dio = Dio();

  Future<FilmModel> getFilm({required String id}) async {
    Response response = await dio.get('$URL_FILMS$id');
    Map<String, dynamic> results = response.data;
    final FilmModel film = FilmModel.fromMap(results);
    return film;
  }

  Future<List<FilmModel>> fetchFilms() async {
    List<FilmModel> films = [];
    Response response = await dio.get(URL_FILMS);
    List results = response.data["results"];
    for (var film in results) {
      films.add(FilmModel.fromMap(film));
    }
    return films;
  }
}
