import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pokedex/model/model.dart';
import 'package:pokedex/pages/pokemon/info_pokemon_page.dart';
import 'package:pokedex/util/app_colors.dart';
import 'package:pokedex/util/app_images.dart';

class CarPokemonWidget extends StatelessWidget {
  final Pokemon pokemon;
  const CarPokemonWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorstypePokemon.colorType[pokemon.types![0].type!.name],
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Center(
              child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    AppImages.whitePokeball,
                    width: 90,
                  ))),
          Positioned(
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                // Text("${pokemon.name}"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfoPokemonPage(
                                  pokemon: pokemon,
                                )));
                  },
                  child: Hero(
                    tag: pokemon.order ?? 'dash',
                    child: CachedNetworkImage(
                      imageUrl: "${pokemon.sprites!.frontDefault}",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              left: 10,
              top: 10,
              child: Text(
                "${pokemon.name}",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                "${pokemon.order.toString().padLeft(3, '0')}",
                style: TextStyle(color: Colors.black, fontSize: 10),
              )),
        ],
      ),
    );
  }
}
