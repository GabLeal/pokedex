import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/layers/presentation/components/grid_pokemons_widget.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';

class TabFavorites extends StatefulWidget {
  @override
  State<TabFavorites> createState() => _TabFavoritesState();
}

class _TabFavoritesState extends State<TabFavorites> {
  PokemonStore _pokemonStore = GetIt.I.get<PokemonStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (_pokemonStore.favoritesPokemons.isEmpty) {
        return Center(
          child: Text(
            'You dont have any favorite pokemons yet. Add them to your list.',
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridPokemonsWidget(pokemons: _pokemonStore.favoritesPokemons),
        );
      }
    });
  }
}
