import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/presentation/components/cache_image_widget.dart';
import 'package:pokedex/layers/presentation/components/slide_image_widget.dart';
import 'package:pokedex/layers/presentation/components/type_widget.dart';
import 'package:pokedex/layers/presentation/pages/pokemon/damage_page.dart';
import 'package:pokedex/layers/presentation/pages/pokemon/moves_page.dart';
import 'package:pokedex/layers/presentation/pages/pokemon/stats_page.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';
import 'package:pokedex/layers/presentation/themes/app_colors.dart';
import 'package:provider/provider.dart';

enum Info { STATS, MOVES, DAMAGE }

class InfoPokemonPage extends StatefulWidget {
  final PokemonEntity pokemon;

  const InfoPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _InfoPokemonPageState createState() => _InfoPokemonPageState();
}

class _InfoPokemonPageState extends State<InfoPokemonPage> {
  Info _info = Info.STATS;

  @override
  Widget build(BuildContext context) {
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
          title: Text("${widget.pokemon.name}".replaceFirst(
              widget.pokemon.name![0], widget.pokemon.name![0].toUpperCase())),
          actions: [
            IconButton(onPressed: () {
              if (_pokemonStore.favoritesPokemons.contains(widget.pokemon)) {
                _pokemonStore.removeFavoritePokemon(widget.pokemon);
              } else {
                _pokemonStore.favoritePokemon(widget.pokemon);
              }
            }, icon: Observer(builder: (_) {
              if (_pokemonStore.favoritesPokemons.contains(widget.pokemon)) {
                return Icon(Icons.star);
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
                      child: SlideImageWidget(children: [
                        CacheImageWidget(
                            pathImage:
                                '${widget.pokemon.sprites!.frontDefault}'),
                        CacheImageWidget(
                            pathImage: '${widget.pokemon.sprites!.backDefault}')
                      ])),
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
                ),
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
                _itemMenu("Stats", Info.STATS),
                _itemMenu("Moves", Info.MOVES),
                _itemMenu("Damage", Info.DAMAGE)
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

  Widget _itemMenu(String label, Info info) {
    Color color =
        ColorstypePokemon.colorType[widget.pokemon.types![0].type!.name]!;
    return GestureDetector(
      onTap: () {
        setState(() {
          _info = info;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: _info == info ? color : Colors.white,
            border: Border.all(color: color, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 13,
              color: _info == info ? Colors.white : color,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
