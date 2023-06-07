import 'package:flutter/material.dart';
import 'package:planet_app/domain/entities/planet.dart';
import 'package:planet_app/domain/usecases/get_planets_use_case.dart';

class PlanetProvider extends ChangeNotifier {
  final GetPlanetsUseCase _getPlanetsUseCase;

  bool _isLoading = false;
  List<Planet> _planets = [];

  PlanetProvider(this._getPlanetsUseCase);

  bool get isLoading => _isLoading;
  List<Planet> get planets => _planets;

  Future<void> getPlanets(String numberPage) async {
    _isLoading = true;
    notifyListeners();

    final planetsResponse = await _getPlanetsUseCase.getPlanets(numberPage);
    _planets.addAll(planetsResponse);
    for (var planet in _planets) {
      print('PLANET ${planet.name}');
    }

    _isLoading = false;
    notifyListeners();
  }
}
