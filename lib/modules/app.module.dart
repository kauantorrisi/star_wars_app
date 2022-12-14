import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/controllers/home.controller.dart';
import 'package:star_wars_app/pages/film_details_page.dart';
import 'package:star_wars_app/pages/home_page.dart';
import 'package:star_wars_app/pages/loading_data_page.dart';
import 'package:star_wars_app/pages/person_details_page.dart';
import 'package:star_wars_app/service/film_service.dart';
import 'package:star_wars_app/service/person_service.dart';
import 'package:star_wars_app/service/planet_service.dart';
import 'package:star_wars_app/service/starship_service.dart';

class AppModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton<PlanetService>((i) => PlanetService()),
    Bind.lazySingleton<PersonService>((i) => PersonService()),
    Bind.lazySingleton<StarshipService>((i) => StarshipService()),
    Bind.lazySingleton<FilmService>((i) => FilmService()),
  ];

  static List<Bind> controllers = [
    Bind.lazySingleton<HomeController>((i) => HomeController()),
  ];

  @override
  List<Bind> get binds => services + controllers;

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/person-details',
          child: (context, args) => PersonDetailsPage(
            person: args.data,
          ),
        ),
        ChildRoute(
          '/film-details',
          child: (context, args) => FilmsDetailsPage(
            title: args.data['title'],
            film: args.data['film'],
          ),
        ),
        ChildRoute(
          '/loading-data',
          child: (context, args) => const LoadingDataPage(),
        ),
      ];
}
