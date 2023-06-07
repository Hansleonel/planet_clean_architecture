import 'package:flutter/material.dart';
import 'package:planet_app/presentation/providers/planets_provider.dart';
import 'package:planet_app/presentation/screens/planet_detail_page.dart';
import 'package:planet_app/presentation/widgets/planet_list_item.dart';
import 'package:provider/provider.dart';

class PlanetsListPage extends StatelessWidget {
  static const route = 'planetPage';
  const PlanetsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planet List'),
      ),
      body: const _PlanetList(),
    );
  }
}

class _PlanetList extends StatefulWidget {
  const _PlanetList({Key? key}) : super(key: key);

  @override
  State<_PlanetList> createState() => _PlanetListState();
}

class _PlanetListState extends State<_PlanetList> {
  final _scrollController = ScrollController();
  late PlanetProvider _planetProvider;
  int numberPage = 1;

  @override
  void initState() {
    super.initState();
    _planetProvider = context.read<PlanetProvider>();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !_planetProvider.isLoading) {
      print('calling');
      numberPage = numberPage + 1;
      print(numberPage);
      _planetProvider.getPlanets('$numberPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('planet page');
    final planetProvider = context.watch<PlanetProvider>();
    if (planetProvider.planets.isEmpty && !planetProvider.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        planetProvider.getPlanets('1');
      });
    }

    return Stack(
      children: [
        if (planetProvider.isLoading && planetProvider.planets.isNotEmpty)
          const Positioned(
            bottom: 24,
            right: 200,
            child: Center(child: CircularProgressIndicator()),
          ),
        SafeArea(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: planetProvider.planets.length,
            itemBuilder: (context, index) {
              final planet = planetProvider.planets[index];
              return PlanetListItem(
                planet: planet,
                onTapItem: () {
                  Navigator.pushNamed(context, PlanetDetailPage.route,
                      arguments: planet);
                },
              );
            },
          ),
        ),
        if (planetProvider.isLoading && planetProvider.planets.isEmpty)
          const Positioned.fill(
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
