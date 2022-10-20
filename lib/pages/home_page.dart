import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/controllers/home.controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:star_wars_app/pages/error_page.dart';
import 'package:star_wars_app/pages/loading_page.dart';
import 'package:star_wars_app/widgets/divider.widget.dart';
import 'package:star_wars_app/widgets/search.widget.dart';
import 'package:star_wars_app/widgets/text.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();

  @override
  void initState() {
    controller.fetchPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: 'STAR WARS', fontSize: 25),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading) return const LoadingPage();
        if (controller.isError) return const ErrorPage();
        return Column(
          children: [
            SearchWidget(
                textController: controller.searchController,
                onChanged: (value) => controller.filterPersons(value)),
            if (controller.isSearching) researchedPersonsList else personsList,
          ],
        );
      }),
    );
  }

  Widget get personsList {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.persons.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: TextWidget(text: controller.persons[index].name),
                onTap: () {
                  Modular.to.pushNamed(
                    '/person-details',
                    arguments: controller.persons[index],
                  );
                },
              ),
              const DividerWidget(),
            ],
          );
        },
      ),
    );
  }

  Widget get researchedPersonsList {
    return controller.researchedPersons.isEmpty
        ? const ListTile(
            title: TextWidget(
              text: 'Não foi encontrado nenhum resultado',
              fontSize: 15,
            ),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: controller.researchedPersons.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: TextWidget(
                          text: controller.researchedPersons[index].name),
                      onTap: () {
                        Modular.to.pushNamed(
                          '/person-details',
                          arguments: controller.researchedPersons[index],
                        );
                      },
                    ),
                    const DividerWidget(),
                  ],
                );
              },
            ),
          );
  }
}
