import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/controllers/home.controller.dart';
import 'package:star_wars_app/pages/error_page.dart';
import 'package:star_wars_app/pages/loading_data_page.dart';
import 'package:star_wars_app/widgets/divider.widget.dart';
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
    controller.initPersonDetails(widget.person);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Informações do personagem',
          fontSize: 16,
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
                        text: 'Ano de aniversário: ${widget.person.birthYear}'),
                    TextWidget(
                        text:
                            'Nome do planeta: ${controller.planet?.name ?? 'N/A'}'),
                    TextWidget(
                        text:
                            'Terreno do planeta: ${controller.planet?.terrain ?? 'N/A'}'),
                    TextWidget(
                        text:
                            'Diâmetro do planeta: ${controller.planet?.diameter ?? 'N/A'}'),
                    TextWidget(
                        text:
                            'Nome da nave: ${controller.starship?.name ?? 'N/A'}'),
                    SizedBox(height: screenSize.height * 0.05),
                    const TextWidget(text: 'Filmes do personagem:'),
                    filmsList,
                  ],
                ),
              ),
              if (controller.isLoading) const LoadingDataPage(),
              if (controller.isError) const ErrorPage(),
            ],
          );
        },
      ),
    );
  }

  Widget get filmsList {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: ListView.builder(
        itemCount: controller.films.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('/film-details', arguments: {
                    'title': widget.person.name,
                    'film': controller.films[index]
                  });
                },
                child: SizedBox(
                  height: screenSize.height * 0.055,
                  child: Center(
                    child: TextWidget(
                      text: controller.films[index].title,
                    ),
                  ),
                ),
              ),
              const DividerWidget(),
            ],
          );
        },
      ),
    );
  }
}
