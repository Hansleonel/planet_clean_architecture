import 'package:flutter/material.dart';
import 'package:planet_app/domain/entities/planet.dart';

class PlanetDetailPage extends StatefulWidget {
  static const route = 'planetDetailPage';
  const PlanetDetailPage({Key? key}) : super(key: key);

  @override
  State<PlanetDetailPage> createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Planet planet = ModalRoute.of(context)!.settings.arguments as Planet;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 160, child: Image.network(planet.image)),
            Text(planet.name)
          ],
        ),
      ),
    );
  }
}
