import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:star_wars_app/common/constants.dart';
import 'package:star_wars_app/models/planet_model.dart';

class PlanetsService extends ChangeNotifier {
  final dio = Dio();

  Future<PlanetModel> getPlanet({required String id}) async {
    Response response = await dio.get(URL_PLANETS + id);
    Map<String, dynamic> results = response.data;
    final PlanetModel planet = PlanetModel.fromMap(results);
    return planet;
  }

  Future<List<PlanetModel>> fetchPlanets() async {
    List<PlanetModel> planets = [];

    Response response = await dio.get(URL_PLANETS);
    List results = response.data;
    for (var planet in results) {
      planets.add(PlanetModel.fromMap(planet));
    }
    return planets;
  }
}
