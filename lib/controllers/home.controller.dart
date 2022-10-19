import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:star_wars_app/common/constants.dart';
import 'package:star_wars_app/models/person_model.dart';
import 'package:star_wars_app/models/planet_model.dart';
import 'package:star_wars_app/service/person_service.dart';
import 'package:star_wars_app/service/planet_service.dart';
part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PlanetsService _planetsService = Modular.get();
  final PersonService _personService = Modular.get();

  int page = 1;

  @observable
  ObservableList<PersonModel> persons = ObservableList<PersonModel>();

  @observable
  PersonModel? person;

  @observable
  PlanetModel? planet;

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  void setIsError(bool value) => isError = value;

  @action
  Future<void> fetchPersons() async {
    try {
      setIsLoading(true);
      setIsError(false);
      persons = ObservableList<PersonModel>();
      persons.addAll(await _personService.fetchPersons());
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> fetchNextPagePersons() async {
    try {
      setIsError(false);
      page++;
      if (page > 9) {
        return;
      }
      persons.addAll(await _personService.fetchPersons(page: page));
    } catch (e) {
      setIsError(true);
    }
  }

  @action
  Future<void> getPlanet(String id) async {
    try {
      planet = null;
      setIsLoading(true);
      setIsError(false);
      id = id.replaceAll(URL_PLANETS, '');
      planet = await _planetsService.getPlanet(id: id);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }
}
