import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: screenSize.height * 0.65),
      child: const FittedBox(
        fit: BoxFit.scaleDown,
        child: CircularProgressIndicator(
          color: Colors.red,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
