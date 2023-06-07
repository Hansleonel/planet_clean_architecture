import 'package:planet_app/data/datasource/planet_data_source.dart';
import 'package:planet_app/domain/entities/planet.dart';
import 'package:planet_app/domain/repository/planet_repository.dart';

import '../models/planet_model.dart';

class PlanetRepositoryImpl implements PlanetRepository {
  final PlanetDataSource _planetDataSource;

  PlanetRepositoryImpl(this._planetDataSource);

  @override
  Future<List<Planet>> getPlanets(String numberPage) async {
    List<PlanetModel> planetModels =
        await _planetDataSource.getPlanets(numberPage);
    List<Planet> planets =
        planetModels.map((model) => model.toPlanetEntity()).toList();
    return planets;
  }
}
