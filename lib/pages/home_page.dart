import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars_app/controllers/home.controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:star_wars_app/pages/error_page.dart';
import 'package:star_wars_app/pages/loading_page.dart';
import 'package:star_wars_app/widgets/button.widget.dart';
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
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
            text: 'STAR WARS', fontSize: 20, fontFamily: 'Starjedi'),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading) return const LoadingPage();
        if (controller.isError) return const ErrorPage();
        return Column(
          children: [
            personList,
            const Spacer(),
            if (controller.page <= 9)
              ButtonWidget(
                onPressed: () => controller.fetchNextPagePersons(),
                child: const Text('Carregar mais...'),
              ),
            SizedBox(height: screenSize.height * 0.025),
          ],
        );
      }),
    );
  }

  Widget get personList {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: controller.page <= 9
          ? screenSize.height * 0.8
          : screenSize.height * 0.85,
      child: ListView.builder(
        itemCount: controller.persons.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(controller.persons[index].name),
                onTap: () {
                  Modular.to.pushNamed(
                    '/person-details',
                    arguments: controller.persons[index],
                  );
                },
              ),
              const Divider(height: 10, color: Colors.white, thickness: 3),
            ],
          );
        },
      ),
    );
  }
}
