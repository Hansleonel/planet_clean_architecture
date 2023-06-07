import 'package:flutter/material.dart';
import 'package:planet_app/config/router/routes.dart';
import 'package:planet_app/config/theme/app_theme.dart';
import 'package:planet_app/data/datasource/planet_data_source.dart';
import 'package:planet_app/data/repository/planet_repository_impl.dart';
import 'package:planet_app/domain/usecases/get_planets_use_case.dart';
import 'package:planet_app/presentation/providers/planets_provider.dart';
import 'package:planet_app/presentation/screens/planets_list_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final planetDataSource = PlanetDataSource();
    final planetRepository = PlanetRepositoryImpl(planetDataSource);
    final getPlanetsUseCase = GetPlanetsUseCase(planetRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => PlanetProvider(getPlanetsUseCase))
      ],
      child: MaterialApp(
        title: 'Planet App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routes: getApplicationRoutes(),
        home: const PlanetsListPage(),
      ),
    );
  }
}
