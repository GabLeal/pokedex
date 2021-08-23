import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/shared/components/grid_pokemons_widget.dart';
import 'package:pokedex/shared/components/loading.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:pokedex/util/enums.dart';
import 'package:provider/provider.dart';

class TabPokemons extends StatefulWidget {
  const TabPokemons({Key? key}) : super(key: key);

  @override
  _TabPokemonsState createState() => _TabPokemonsState();
}

class _TabPokemonsState extends State<TabPokemons> {
  @override
  void initState() {
    final pokemonStore = context.read<PokemonStore>();

    pokemonStore.getPokemons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PokemonStore _pokemonStore = Provider.of<PokemonStore>(context);
    return Stack(
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
