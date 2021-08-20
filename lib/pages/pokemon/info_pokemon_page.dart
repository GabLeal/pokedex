import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/util/app_colors.dart';

class InfoPokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const InfoPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor:
              ColorstypePokemon.colorType[pokemon.types![0].type!.name],
          pinned: true,
          floating: true,
          snap: true,
          centerTitle: true,
          title: Text("${pokemon.name}"),
          expandedHeight: 220.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: pokemon.order ?? 'dash',
                  child: CachedNetworkImage(
                    imageUrl: "${pokemon.sprites!.frontDefault}",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.types!.map((t) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        elevation: 3,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 0.5),
                                color:
                                    ColorstypePokemon.colorType[t.type!.name],
                                borderRadius: BorderRadius.circular(7)),
                            child: Text(
                              "${t.type!.name}",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          )),
        ),
        // SliverList(delegate: SliverChildListDelegate(_buildList(10)))
      ],
    ));
  }
}
