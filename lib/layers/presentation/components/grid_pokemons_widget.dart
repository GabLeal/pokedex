import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/presentation/components/card_pokemon_widget.dart';

class GridPokemonsWidget extends StatelessWidget {
  final List<PokemonEntity> pokemons;
  const GridPokemonsWidget({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
          key: const Key('gridPokemons'),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            var pokemon = pokemons[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: ScaleAnimation(
                child: SlideAnimation(
                  child: CarPokemonWidget(
                    key: Key('cardPokemon' + index.toString()),
                    pokemon: pokemon,
                  ),
                ),
              ),
            );
          }),
    );

    // GridView.builder(
  }
}
