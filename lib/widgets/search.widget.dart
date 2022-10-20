import 'package:flutter/material.dart';
import 'package:star_wars_app/widgets/text.widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.textController,
    this.onChanged,
  });

  final TextEditingController textController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height * 0.015),
      child: SizedBox(
        height: screenSize.height * 0.07,
        child: TextFormField(
          controller: textController,
          onChanged: onChanged,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
                gapPadding: 10,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
                gapPadding: 10,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: const TextWidget(
                  text: 'Pesquise um personagem', fontSize: 16),
              labelStyle: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
