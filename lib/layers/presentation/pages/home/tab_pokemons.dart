import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/presentation/components/button_retry.dart';
import 'package:pokedex/layers/presentation/components/grid_pokemons_widget.dart';
import 'package:pokedex/layers/presentation/components/loading_widget.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';

class TabPokemons extends StatefulWidget {
  @override
  State<TabPokemons> createState() => _TabPokemonsState();
}

class _TabPokemonsState extends State<TabPokemons> {
  PokemonStore _pokemonStore = GetIt.I.get<PokemonStore>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                child: LoadingWidget(),
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
          return ButtonRetry(onTap: pokemonStore.getPokemons);

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
              child: GridPokemonsWidget(
                pokemons: pokemonStore.pokemons,
              ),
            ),
          );
      }
    });
  }
}
