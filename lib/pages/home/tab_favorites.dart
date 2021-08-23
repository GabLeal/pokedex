import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/shared/components/grid_pokemons_widget.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:provider/provider.dart';

class TabFavorites extends StatefulWidget {
  const TabFavorites({Key? key}) : super(key: key);

  @override
  _TabFavoritesState createState() => _TabFavoritesState();
}

class _TabFavoritesState extends State<TabFavorites> {
  @override
  void initState() {
    final pokemonStore = context.read<PokemonStore>();

    pokemonStore.getFavoritesPokemons();
    super.initState();
  }

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
