import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/extension/list_extension.dart';
import 'package:pokedex/core/util/constants.dart';
import 'package:pokedex/layers/presentation/components/cache_image_widget.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';
import 'package:pokedex/layers/presentation/themes/app_images.dart';

class MyTeamShortWidget extends StatefulWidget {
  MyTeamShortWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTeamShortWidget> createState() => _MyTeamShortWidgetState();
}

class _MyTeamShortWidgetState extends State<MyTeamShortWidget> {
  PokemonStore _pokemonStore = GetIt.I.get<PokemonStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFDFDFDF),
      child: Observer(
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: Text('My team'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  children: [
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              deafultMaxLengthTeamPokemons,
                              (index) => CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Image.asset(
                                  AppImages.whitePokeball,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              deafultMaxLengthTeamPokemons,
                              (index) {
                                var indexExists =
                                    _pokemonStore.myTeamPokemon.containsIndex(
                                  index,
                                );

                                return indexExists
                                    ? Hero(
                                        tag: _pokemonStore
                                                .myTeamPokemon[index].order!
                                                .toString() +
                                            '_cartTag',
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.black.withOpacity(0.5),
                                          child: CacheImageWidget(
                                            key: Key('pokemonMyTeam$index'),
                                            pathImage: _pokemonStore
                                                .myTeamPokemon[index]
                                                .sprites!
                                                .frontDefault!,
                                          ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                      );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                      ),
                      child: Text(
                        _pokemonStore.myTeamPokemon.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
