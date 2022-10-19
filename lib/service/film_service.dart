import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:star_wars_app/common/constants.dart';
import '../models/film_model.dart';

class FilmsService extends ChangeNotifier {
  final dio = Dio();

  Future<void> getFilm({required String id}) async {
    // id = id.replaceAll('https://swapi.dev/api/planets/', '');
    try {
      Response response = await dio.get('$URL_FILMS$id');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FilmModel>> fetchFilms() async {
    try {
      List<FilmModel> films = [];
      Response response = await dio.get(URL_FILMS);
      List results = response.data["results"];
      for (var film in results) {
        films.add(FilmModel.fromMap(film));
      }
      return films;
    } catch (e) {
      rethrow;
    }
  }
}
