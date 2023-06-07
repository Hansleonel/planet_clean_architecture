import '../entities/planet.dart';

abstract class PlanetRepository {
  Future<List<Planet>> getPlanets(String numberPage);
}
