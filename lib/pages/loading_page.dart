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
            'https://i.pinimg.com/originals/5c/79/c1/5c79c1ce194834d58ef0b9e330b46414.png',
            fit: BoxFit.cover,
          ),
          const LoadingWidget(),
        ],
      ),
    );
  }
}
