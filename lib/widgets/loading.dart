import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: screenSize.height * 0.65),
      child: const CircularProgressIndicator(
        color: Colors.red,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
