import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/pages/pokemon/damage_page.dart';
import 'package:pokedex/pages/pokemon/moves_page.dart';
import 'package:pokedex/pages/pokemon/stats_page.dart';
import 'package:pokedex/shared/components/type_widget.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:pokedex/util/app_colors.dart';
import 'package:provider/provider.dart';

enum Info { STATS, MOVES, DAMAGE }

class InfoPokemonPage extends StatefulWidget {
  final Pokemon pokemon;

  const InfoPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _InfoPokemonPageState createState() => _InfoPokemonPageState();
}

class _InfoPokemonPageState extends State<InfoPokemonPage> {
  Info _info = Info.STATS;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PokemonStore _pokemonStore = Provider.of<PokemonStore>(context);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor:
              ColorstypePokemon.colorType[widget.pokemon.types![0].type!.name],
          pinned: true,
          floating: true,
          snap: true,
          centerTitle: true,
          title: Text(
            "${widget.pokemon.name}",
          ),
          actions: [
            IconButton(onPressed: () {
              if (_pokemonStore.favoritesPokemons.contains(widget.pokemon)) {
                _pokemonStore.removeFavoritePokemon(widget.pokemon);
              } else {
                _pokemonStore.favoritePokemon(widget.pokemon);
              }
            }, icon: Observer(builder: (_) {
              if (_pokemonStore.favoritesPokemons.contains(widget.pokemon)) {
                return Icon(Icons.stacked_bar_chart_sharp);
              } else {
                return Icon(Icons.star_border);
              }
            }))
          ],
          expandedHeight: 220.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Center(
            child: Stack(
              children: [
                Center(
                  child: Hero(
                    tag: widget.pokemon.order ?? 'dash',
                    child: CachedNetworkImage(
                      imageUrl: "${widget.pokemon.sprites!.frontDefault}",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.pokemon.types!.map((t) {
                        return TypeWidget(
                          nameType: "${t.type!.name}",
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _itemMenu("Stats", () {
                  setState(() {
                    _info = Info.STATS;
                  });
                }),
                _itemMenu("Moves", () {
                  setState(() {
                    _info = Info.MOVES;
                  });
                }),
                _itemMenu("Damage", () {
                  setState(() {
                    _info = Info.DAMAGE;
                  });
                })
              ],
            ),
          ),
          if (_info == Info.STATS)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: StatsPage(pokemon: widget.pokemon),
            )
          else if (_info == Info.MOVES)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: MovesPage(pokemon: widget.pokemon),
            )
          else if (_info == Info.DAMAGE)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: DamagePage(pokemon: widget.pokemon),
            )
        ]))
      ],
    ));
  }

  Widget _itemMenu(String label, Function() ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                color: ColorstypePokemon
                        .colorType[widget.pokemon.types![0].type!.name] ??
                    Colors.white,
                width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          label,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
