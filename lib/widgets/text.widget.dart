import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.fontSize = 17,
  });

  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toLowerCase(),
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
