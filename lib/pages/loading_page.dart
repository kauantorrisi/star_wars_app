import 'package:flutter/material.dart';
import '../widgets/loading.widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://wallpaperaccess.com/full/199667.jpg',
            fit: BoxFit.cover,
          ),
          const LoadingWidget(),
        ],
      ),
    );
  }
}
