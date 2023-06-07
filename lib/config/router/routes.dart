import 'package:flutter/material.dart';
import 'package:planet_app/presentation/screens/planet_detail_page.dart';
import 'package:planet_app/presentation/screens/planets_list_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    PlanetsListPage.route: (context) => const PlanetsListPage(),
    PlanetDetailPage.route: (context) => const PlanetDetailPage(),
  };
}
