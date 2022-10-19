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

  late final _$personAtom =
      Atom(name: '_HomeControllerBase.person', context: context);

  @override
  PersonModel? get person {
    _$personAtom.reportRead();
    return super.person;
  }

  @override
  set person(PersonModel? value) {
    _$personAtom.reportWrite(value, super.person, () {
      super.person = value;
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

  late final _$fetchPersonsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchPersons', context: context);

  @override
  Future<void> fetchPersons() {
    return _$fetchPersonsAsyncAction.run(() => super.fetchPersons());
  }

  late final _$fetchNextPagePersonsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchNextPagePersons', context: context);

  @override
  Future<void> fetchNextPagePersons() {
    return _$fetchNextPagePersonsAsyncAction
        .run(() => super.fetchNextPagePersons());
  }

  late final _$getPlanetAsyncAction =
      AsyncAction('_HomeControllerBase.getPlanet', context: context);

  @override
  Future<void> getPlanet(String id) {
    return _$getPlanetAsyncAction.run(() => super.getPlanet(id));
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

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
  String toString() {
    return '''
persons: ${persons},
person: ${person},
planet: ${planet},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
