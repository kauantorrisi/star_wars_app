import 'package:flutter/material.dart';
import '../models/planet_model.dart';

class PlanetsList extends StatelessWidget {
  const PlanetsList({
    super.key,
    required this.planets,
  });

  final List<PlanetModel> planets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: planets.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(planets[index].name),
            const Divider(
              height: 10,
              color: Colors.white,
              thickness: 3,
            ),
          ],
        );
      },
    );
  }
}
