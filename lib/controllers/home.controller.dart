import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:star_wars_app/common/constants.dart';
import 'package:star_wars_app/models/film_model.dart';
import 'package:star_wars_app/models/person_model.dart';
import 'package:star_wars_app/models/planet_model.dart';
import 'package:star_wars_app/models/starship_model.dart';
import 'package:star_wars_app/service/film_service.dart';
import 'package:star_wars_app/service/person_service.dart';
import 'package:star_wars_app/service/planet_service.dart';
import 'package:star_wars_app/service/starship_service.dart';
part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PlanetService _planetsService = Modular.get();
  final PersonService _personService = Modular.get();
  final StarshipService _starshipService = Modular.get();
  final FilmService _filmService = Modular.get();

  int page = 1;

  @observable
  ObservableList<PersonModel> persons = ObservableList<PersonModel>();

  @observable
  ObservableList<StarshipModel> starships = ObservableList<StarshipModel>();

  @observable
  ObservableList<FilmModel> films = ObservableList<FilmModel>();

  @observable
  StarshipModel? starship;

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
  void restartStarship() => starship = null;

  Future<void> initPersonDetails(PersonModel person) async {
    try {
      setIsLoading(true);
      setIsError(false);
      restartStarship();
      await getPlanet(person.homeworld);
      await fetchFilms();
      if (person.starships.isNotEmpty) {
        await getStarship(person.starships[0]);
      }
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> fetchStarShips() async {
    try {
      setIsLoading(true);
      setIsError(false);
      starships = ObservableList<StarshipModel>();
      starships.addAll(await _starshipService.fetchStarships());
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @action
  Future<void> fetchFilms() async {
    try {
      setIsLoading(true);
      setIsError(false);
      films = ObservableList<FilmModel>();
      films.addAll(await _filmService.fetchFilms());
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }

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

  @action
  Future<void> getStarship(String id) async {
    try {
      setIsLoading(true);
      setIsError(false);
      id = id.replaceAll(URL_STARSHIPS, '');
      starship = await _starshipService.getStarship(id: id);
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }
}
