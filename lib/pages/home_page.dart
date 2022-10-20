import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:star_wars_app/controllers/home.controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:star_wars_app/pages/error_page.dart';
import 'package:star_wars_app/pages/loading_page.dart';
import 'package:star_wars_app/widgets/divider.widget.dart';
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
        title: const TextWidget(text: 'STAR WARS', fontSize: 20),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        if (controller.isLoading) return const LoadingPage();
        if (controller.isError) return const ErrorPage();
        return Column(
          children: [
            personList,
          ],
        );
      }),
    );
  }

  Widget get personList {
    return Expanded(
      child: LazyLoadScrollView(
        onEndOfPage: () => controller.fetchNextPagePersons(),
        child: ListView.builder(
          itemCount: controller.persons.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(controller.persons[index].name.toLowerCase()),
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
      ),
    );
  }
}
