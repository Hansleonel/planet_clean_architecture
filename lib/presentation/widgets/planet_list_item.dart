import 'package:flutter/material.dart';
import 'package:planet_app/domain/entities/planet.dart';
import 'package:planet_app/presentation/screens/planet_detail_page.dart';

import '../../config/theme/app_theme.dart';

class PlanetListItem extends StatelessWidget {
  const PlanetListItem({
    super.key,
    required this.planet,
    required this.onTapItem,
  });

  final Planet planet;
  final VoidCallback onTapItem;

  @override
  Widget build(BuildContext context) {
    final styleColorSecondary = AppTheme().getTheme().secondaryHeaderColor;
    return ListTile(
        trailing: const Icon(
          Icons.navigate_next,
          size: 32,
        ),
        leading: Image.network(planet.image),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planet.description,
            ),
            Text(
              'Graviti: ${planet.gravity}',
              style: TextStyle(color: styleColorSecondary),
            ),
            Text(
              'Population: ${planet.population}',
              style: TextStyle(color: styleColorSecondary),
            ),
            Text(
              'Rotation Period: ${planet.rotationPeriod}',
              style: TextStyle(color: styleColorSecondary),
            ),
          ],
        ),
        title: Text(planet.name),
        onTap: () => onTapItem());
  }
}
