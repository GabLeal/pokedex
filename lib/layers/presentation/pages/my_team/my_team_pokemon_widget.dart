import 'package:flutter/material.dart';
import 'package:pokedex/core/util/constants.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/presentation/components/cache_image_widget.dart';
import 'package:pokedex/layers/presentation/components/type_widget.dart';

class MyTeamPokemonWidget extends StatelessWidget {
  const MyTeamPokemonWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      // color: Colors.blueAccent,
      child: Row(
        children: [
          Container(
            width: 60,
            child: CacheImageWidget(
              pathImage: pokemon.sprites!.frontDefault!,
            ),
          ),
          Text(
            pokemon.name!,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Spacer(),
          TypeWidget(
            nameType: pokemon.types![0].type!.name.toString(),
          ),
        ],
      ),
    );
  }
}
