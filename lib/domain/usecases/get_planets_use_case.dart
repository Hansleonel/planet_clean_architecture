import 'package:planet_app/domain/entities/planet.dart';
import 'package:planet_app/domain/repository/planet_repository.dart';

class GetPlanetsUseCase {
  final PlanetRepository _planetRepository;

  GetPlanetsUseCase(this._planetRepository);

  Future<List<Planet>> getPlanets(String numberPage) async {
    return await _planetRepository.getPlanets(numberPage);
  }
}
