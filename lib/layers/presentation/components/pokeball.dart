import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/util/constants.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'dart:math';

import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';

class Pokeball extends StatefulWidget {
  Pokeball({
    Key? key,
    required this.onTap,
    required,
    required this.pokemon,
  }) : super(key: key);
  final VoidCallback onTap;
  final PokemonEntity pokemon;

  @override
  State<Pokeball> createState() => _PokeballState();
}

class _PokeballState extends State<Pokeball> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  PokemonStore _pokemonStore = GetIt.I.get<PokemonStore>();

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: defaultTimeTransition);
    animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(animationController);
  }

  addMyTeamPokemon() {
    if (_pokemonStore.pokemonIsMyTeam(widget.pokemon.id)) {
      _pokemonStore.removeMyTeamPokemon(widget.pokemon);
      animationController.forward(from: -pi / 2);
    } else {
      _pokemonStore.addMyTeamPokemon(widget.pokemon);
      animationController.forward(from: -pi / 2).whenComplete(() {
        widget.onTap();
      });
    }
  }

  var height = 20.0;

  var width = 40.0;

  var heightCenterBall = 3.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return Container(
          width: width,
          height: height * 2,
          child: GestureDetector(
            onTap: addMyTeamPokemon,
            child: Transform.rotate(
              angle: animation.value,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50.0),
                          ),
                          color:
                              _pokemonStore.pokemonIsMyTeam(widget.pokemon.id)
                                  ? Colors.red
                                  : Colors.white,
                        ),
                      ),
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50.0),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      color: Colors.black,
                      height: 3,
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      height: 10,
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      height: heightCenterBall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
