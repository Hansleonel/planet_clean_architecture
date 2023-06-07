import 'package:planet_app/domain/entities/planet.dart';

class PlanetModel {
  String name;
  String rotationPeriod;
  String orbitalPeriod;
  String diameter;
  String climate;
  String gravity;
  String terrain;
  String surfaceWater;
  String population;
  String url;

  PlanetModel({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
    required this.url,
  });

  factory PlanetModel.fromJson(Map<String, dynamic> json) => PlanetModel(
      name: json['name'],
      rotationPeriod: json['rotation_period'],
      orbitalPeriod: json['orbital_period'],
      diameter: json['diameter'],
      climate: json['climate'],
      gravity: json['gravity'],
      terrain: json['terrain'],
      surfaceWater: json['surface_water'],
      population: json['population'],
      url: json['url']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "rotation_period": rotationPeriod,
        "orbital_period": orbitalPeriod,
        "diameter": diameter,
        "climate": climate,
        "gravity": gravity,
        "terrain": terrain,
        "surface_water": surfaceWater,
        "population": population,
        "url": url,
      };

  Planet toPlanetEntity() => Planet(
        name: name,
        description: terrain,
        population: population,
        image:
            'https://raw.githubusercontent.com/marjandn/Flutter-Planets-App/main/assets/images/mars.png',
        gravity: gravity,
        rotationPeriod: rotationPeriod,
      );
}
