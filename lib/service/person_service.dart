import 'dart:async';
import 'package:star_wars_app/common/constants.dart';
import '../models/person_model.dart';
import 'package:dio/dio.dart';

class PersonService {
  final Dio dio = Dio();

  Future<List<PersonModel>> searchPersons(
      {required String searchControllerText}) async {
    List<PersonModel> researchedPersons = [];
    Response response = await dio.get(URL_SEARCH + searchControllerText);
    List results = response.data['results'];
    for (var person in results) {
      researchedPersons.add(PersonModel.fromMap(person));
    }
    return researchedPersons;
  }

  Future<List<PersonModel>> fetchPersons({int? page}) async {
    List<PersonModel> persons = [];
    Response response = await dio
        .get('$URL_PERSONS?page=${page != null ? page.toString() : '1'}');
    List results = response.data["results"];
    for (var person in results) {
      persons.add(PersonModel.fromMap(person));
    }
    return persons;
  }
}
