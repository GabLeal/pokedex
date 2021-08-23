import 'package:flutter/material.dart';

import 'package:pokedex/model/model.dart';
import 'package:pokedex/shared/components/card_pokemon_widget.dart';

class GridPokemonsWidget extends StatelessWidget {
  final List<Pokemon> pokemons;
  const GridPokemonsWidget({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          var pokemon = pokemons[index];
          return CarPokemonWidget(
            pokemon: pokemon,
          );
        });
  }
}
