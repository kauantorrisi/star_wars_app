import 'package:flutter/material.dart';
import 'package:star_wars_app/models/film_model.dart';
import 'package:star_wars_app/widgets/text.widget.dart';

class FilmsDetailsPage extends StatelessWidget {
  const FilmsDetailsPage({super.key, required this.title, required this.film});

  final String title;
  final FilmModel film;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.1,
            vertical: screenSize.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: 'Título: ${film.title}', fontSize: 20),
            SizedBox(height: screenSize.height * 0.02),
            TextWidget(
              text: 'Diretor: ${film.director}',
              fontSize: 20,
            ),
            SizedBox(height: screenSize.height * 0.02),
            TextWidget(
                text: 'Data de lançamento: ${film.created}', fontSize: 20),
            SizedBox(height: screenSize.height * 0.02),
            TextWidget(
              text: 'Produtores: ${film.producer}',
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
