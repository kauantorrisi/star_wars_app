import 'package:flutter/material.dart';
import 'package:star_wars_app/widgets/text.widget.dart';
import '../widgets/loading.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            'https://r1.ilikewallpaper.net/pic/202006/r2dr-minimalism-99837-1242x2688_640.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.5),
              child: const TextWidget(
                text: 'STAR WARS',
                fontSize: 40,
                fontFamily: 'Starjedi',
              ),
            ),
          ),
          const Loading(),
        ],
      ),
    );
  }
}
