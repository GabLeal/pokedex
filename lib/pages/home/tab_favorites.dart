import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/shared/components/grid_pokemons_widget.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:provider/provider.dart';

class TabFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokemonStore _pokemonStore = Provider.of<PokemonStore>(context);
    return Observer(builder: (_) {
      if (_pokemonStore.favoritesPokemons.isEmpty) {
        return Center(
            child: Text(
          'Você ainda não possuim pokemons favoritos. Adicone eles a sua lista.',
          textAlign: TextAlign.center,
        ));
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridPokemonsWidget(pokemons: _pokemonStore.favoritesPokemons),
        );
      }
    });
  }
}
