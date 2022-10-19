import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/controllers/home.controller.dart';
import 'package:star_wars_app/pages/error_page.dart';
import 'package:star_wars_app/pages/loading_page.dart';
import 'package:star_wars_app/widgets/text.widget.dart';
import '../models/person_model.dart';

class PersonDetailsPage extends StatefulWidget {
  const PersonDetailsPage({
    super.key,
    required this.person,
  });

  final PersonModel person;

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  final HomeController controller = Modular.get();

  @override
  void initState() {
    controller.getPlanet(widget.person.homeworld);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informações do personagem',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text: 'Nome: ${widget.person.name}', fontSize: 20),
                    TextWidget(
                        text: 'Gênero: ${widget.person.gender}', fontSize: 20),
                    TextWidget(
                      text: 'Ano de aniversário: ${widget.person.birthYear}',
                      fontSize: 20,
                    ),
                    TextWidget(
                      text: 'Nome do planeta: ${controller.planet?.name ?? ''}',
                      fontSize: 20,
                    ),
                    TextWidget(
                      text:
                          'Terreno do planeta: ${controller.planet?.terrain ?? ''}',
                      fontSize: 20,
                    ),
                    TextWidget(
                      text:
                          'Diâmetro do planeta: ${controller.planet?.diameter ?? ''}',
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
              if (controller.isLoading) const LoadingPage(),
              if (controller.isError) const ErrorPage(),
            ],
          );
        },
      ),
    );
  }
}
