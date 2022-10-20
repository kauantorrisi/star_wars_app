import 'package:flutter/material.dart';
import 'package:star_wars_app/widgets/text.widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            'https://wallpaperaccess.com/full/351156.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.3),
              child: const TextWidget(
                text: 'Ocorreu um erro...',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
