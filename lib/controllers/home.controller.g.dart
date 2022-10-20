// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$personsAtom =
      Atom(name: '_HomeControllerBase.persons', context: context);

  @override
  ObservableList<PersonModel> get persons {
    _$personsAtom.reportRead();
    return super.persons;
  }

  @override
  set persons(ObservableList<PersonModel> value) {
    _$personsAtom.reportWrite(value, super.persons, () {
      super.persons = value;
    });
  }

  late final _$starshipsAtom =
      Atom(name: '_HomeControllerBase.starships', context: context);

  @override
  ObservableList<StarshipModel> get starships {
    _$starshipsAtom.reportRead();
    return super.starships;
  }

  @override
  set starships(ObservableList<StarshipModel> value) {
    _$starshipsAtom.reportWrite(value, super.starships, () {
      super.starships = value;
    });
  }

  late final _$filmsAtom =
      Atom(name: '_HomeControllerBase.films', context: context);

  @override
  ObservableList<FilmModel> get films {
    _$filmsAtom.reportRead();
    return super.films;
  }

  @override
  set films(ObservableList<FilmModel> value) {
    _$filmsAtom.reportWrite(value, super.films, () {
      super.films = value;
    });
  }

  late final _$researchedPersonsAtom =
      Atom(name: '_HomeControllerBase.researchedPersons', context: context);

  @override
  ObservableList<PersonModel> get researchedPersons {
    _$researchedPersonsAtom.reportRead();
    return super.researchedPersons;
  }

  @override
  set researchedPersons(ObservableList<PersonModel> value) {
    _$researchedPersonsAtom.reportWrite(value, super.researchedPersons, () {
      super.researchedPersons = value;
    });
  }

  late final _$starshipAtom =
      Atom(name: '_HomeControllerBase.starship', context: context);

  @override
  StarshipModel? get starship {
    _$starshipAtom.reportRead();
    return super.starship;
  }

  @override
  set starship(StarshipModel? value) {
    _$starshipAtom.reportWrite(value, super.starship, () {
      super.starship = value;
    });
  }

  late final _$planetAtom =
      Atom(name: '_HomeControllerBase.planet', context: context);

  @override
  PlanetModel? get planet {
    _$planetAtom.reportRead();
    return super.planet;
  }

  @override
  set planet(PlanetModel? value) {
    _$planetAtom.reportWrite(value, super.planet, () {
      super.planet = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_HomeControllerBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$isSearchingAtom =
      Atom(name: '_HomeControllerBase.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: '_HomeControllerBase.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$fetchStarShipsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchStarShips', context: context);

  @override
  Future<void> fetchStarShips() {
    return _$fetchStarShipsAsyncAction.run(() => super.fetchStarShips());
  }

  late final _$fetchFilmsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchFilms', context: context);

  @override
  Future<void> fetchFilms() {
    return _$fetchFilmsAsyncAction.run(() => super.fetchFilms());
  }

  late final _$fetchPersonsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchPersons', context: context);

  @override
  Future<void> fetchPersons() {
    return _$fetchPersonsAsyncAction.run(() => super.fetchPersons());
  }

  late final _$filterPersonsAsyncAction =
      AsyncAction('_HomeControllerBase.filterPersons', context: context);

  @override
  Future<void> filterPersons(String searchControllerText) {
    return _$filterPersonsAsyncAction
        .run(() => super.filterPersons(searchControllerText));
  }

  late final _$getPlanetAsyncAction =
      AsyncAction('_HomeControllerBase.getPlanet', context: context);

  @override
  Future<void> getPlanet(String id) {
    return _$getPlanetAsyncAction.run(() => super.getPlanet(id));
  }

  late final _$getStarshipAsyncAction =
      AsyncAction('_HomeControllerBase.getStarship', context: context);

  @override
  Future<void> getStarship(String id) {
    return _$getStarshipAsyncAction.run(() => super.getStarship(id));
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void setIsResearched(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsResearched');
    try {
      return super.setIsResearched(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSearching(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsSearching');
    try {
      return super.setIsSearching(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restartStarship() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.restartStarship');
    try {
      return super.restartStarship();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
persons: ${persons},
starships: ${starships},
films: ${films},
researchedPersons: ${researchedPersons},
starship: ${starship},
planet: ${planet},
isLoading: ${isLoading},
isError: ${isError},
isSearching: ${isSearching},
searchController: ${searchController}
    ''';
  }
}
