import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/controllers/home.controller.dart';
import 'package:star_wars_app/pages/home_page.dart';
import 'package:star_wars_app/pages/person_details_page.dart';
import 'package:star_wars_app/service/person_service.dart';
import 'package:star_wars_app/service/planet_service.dart';
import 'package:star_wars_app/service/starship_service.dart';

class AppModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton<PlanetService>((i) => PlanetService()),
    Bind.lazySingleton<PersonService>((i) => PersonService()),
    Bind.lazySingleton<StarshipService>((i) => StarshipService()),
  ];

  static List<Bind> controllers = [
    Bind.lazySingleton<HomeController>((i) => HomeController()),
  ];

  @override
  List<Bind> get binds => services + controllers;

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
        ChildRoute('/person-details',
            child: (context, args) => PersonDetailsPage(
                  person: args.data,
                )),
      ];
}
