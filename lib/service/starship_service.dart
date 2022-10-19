import 'package:dio/dio.dart';
import 'package:star_wars_app/common/constants.dart';
import 'package:star_wars_app/models/starship_model.dart';

class StarshipService {
  final Dio dio = Dio();

  Future<StarshipModel> getStarship({required String id}) async {
    Response response = await dio.get(URL_STARSHIPS + id);
    Map<String, dynamic> results = response.data;
    final StarshipModel starship = StarshipModel.fromMap(results);
    return starship;
  }

  Future<List<StarshipModel>> fetchStarships({int? page}) async {
    List<StarshipModel> starships = [];
    Response response = await dio
        .get('$URL_STARSHIPS?page=${page != null ? page.toString() : '1'}');
    List results = response.data["results"];
    for (var starship in results) {
      starships.add(StarshipModel.fromMap(starship));
    }
    return starships;
  }
}
