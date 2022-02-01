import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
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
              Row(
                children: [
                  const SizedBox(width: defaultPadding),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Stack(
                      children: [
                        Row(
                          children: List.generate(
                            6,
                            (index) => Padding(
                              padding: const EdgeInsets.only(
                                  right: defaultPadding / 2),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Image.asset(AppImages.whitePokeball),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: List.generate(
                            _pokemonStore.myTeamPokemon.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(
                                  right: defaultPadding / 2),
                              child: Hero(
                                tag: _pokemonStore.myTeamPokemon[index].order!
                                        .toString() +
                                    '_cartTag',
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.5),
                                  child: CacheImageWidget(
                                    pathImage: _pokemonStore
                                        .myTeamPokemon[index]
                                        .sprites!
                                        .frontDefault!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: defaultPadding / 2),
                    child: Text(
                      _pokemonStore.myTeamPokemon.length.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
