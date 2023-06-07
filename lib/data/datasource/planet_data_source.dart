import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:planet_app/data/models/planet_model.dart';

class PlanetDataSource {
  final String baseUrl = 'https://swapi.dev/api';

  Future<List<PlanetModel>> getPlanets(String numberPage) async {
    final response =
        await http.get(Uri.parse('$baseUrl/planets/?page=$numberPage'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List planetJson = data['results'];
      return planetJson.map((json) => PlanetModel.fromJson(json)).toList();
    } else {
      throw Exception('Error getting planets: ${response.statusCode}');
    }
  }
}
