import 'package:flutter/material.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/pages/pokemon/info_pokemon_page.dart';
import 'package:pokedex/shared/components/cache_image_widget.dart';
import 'package:pokedex/themes/app_colors.dart';
import 'package:pokedex/themes/app_images.dart';

class CarPokemonWidget extends StatelessWidget {
  final Pokemon pokemon;
  const CarPokemonWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoPokemonPage(
                      pokemon: pokemon,
                    )));
      },
      child: Container(
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
                  Hero(
                      tag: pokemon.order ?? 'dash',
                      child: CacheImageWidget(
                          pathImage: '${pokemon.sprites!.frontDefault}'))
                ],
              ),
            ),
            Positioned(
                left: 10,
                top: 10,
                child: Text(
                  "${pokemon.name}".replaceFirst(
                      pokemon.name![0], pokemon.name![0].toUpperCase()),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            Positioned(
                left: 10,
                bottom: 10,
                child: Text(
                  "Nº${pokemon.order.toString().padLeft(3, '0')}",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )),
          ],
        ),
      ),
    );
  }
}
