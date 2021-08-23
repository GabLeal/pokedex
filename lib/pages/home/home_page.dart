import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/shared/components/app_bar_widget.dart';
import 'package:pokedex/shared/components/grid_pokemons_widget.dart';
import 'package:pokedex/shared/components/loading.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:pokedex/util/enums.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final pokemonStore = context.read<PokemonStore>();

    pokemonStore.getPokemons();
    pokemonStore.getFavoritesPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PokemonStore _pokemonStore = Provider.of<PokemonStore>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBarWidget(),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  _listaPokemons(_pokemonStore),
                  Observer(builder: (_) {
                    if (_pokemonStore.statusRequest == StatusRequest.loading) {
                      return Container(
                        height: size.height,
                        width: size.width,
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Loading(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })
                ],
              ),
              Observer(builder: (_) {
                if (_pokemonStore.favoritesPokemons.isEmpty) {
                  return Center(
                      child: Text(
                    'Você ainda não possuim pokemons favoritos. Adicone eles a sua lista.',
                    textAlign: TextAlign.center,
                  ));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridPokemonsWidget(
                        pokemons: _pokemonStore.favoritesPokemons),
                  );
                }
              })
            ],
          )),
    );
  }

  Widget _listaPokemons(PokemonStore pokemonStore) {
    return Observer(builder: (_) {
      switch (pokemonStore.statusRequest) {
        case StatusRequest.error:
          return Container(
              child: ElevatedButton(
            child: Text("Tentar novamente"),
            onPressed: pokemonStore.getPokemons,
          ));

        default:
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NotificationListener<ScrollEndNotification>(
                  onNotification: (scrollEnd) {
                    var metrics = scrollEnd.metrics;
                    if (metrics.atEdge) {
                      if (metrics.pixels != 0) pokemonStore.getPokemons();
                    }
                    return true;
                  },
                  child: GridPokemonsWidget(pokemons: pokemonStore.pokemons)));
      }
    });
  }
}
