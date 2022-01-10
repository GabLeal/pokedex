import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/presentation/components/cache_image_widget.dart';
import 'package:pokedex/layers/presentation/components/item_menu_pokemon_widget.dart';
import 'package:pokedex/layers/presentation/components/slide_image_widget.dart';
import 'package:pokedex/layers/presentation/components/type_widget.dart';
import 'package:pokedex/layers/presentation/pages/pokemon/damage_page.dart';
import 'package:pokedex/layers/presentation/pages/pokemon/moves_page.dart';
import 'package:pokedex/layers/presentation/pages/pokemon/stats_page.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';
import 'package:pokedex/layers/presentation/themes/app_colors.dart';

enum Info { STATS, MOVES, DAMAGE }

class InfoPokemonPage extends StatefulWidget {
  final PokemonEntity pokemon;

  const InfoPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _InfoPokemonPageState createState() => _InfoPokemonPageState();
}

class _InfoPokemonPageState extends State<InfoPokemonPage> {
  Info _info = Info.STATS;
  PokemonStore _pokemonStore = GetIt.I.get<PokemonStore>();

  @override
  Widget build(BuildContext context) {
    var colorPokemon =
        ColorstypePokemon.colorType[widget.pokemon.types![0].type!.name]!;
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
            IconButton(
              onPressed: () {
                if (_pokemonStore.favoritesPokemons.contains(widget.pokemon)) {
                  _pokemonStore.removeFavoritePokemon(widget.pokemon);
                } else {
                  _pokemonStore.favoritePokemon(widget.pokemon);
                }
              },
              icon: Observer(builder: (_) {
                if (_pokemonStore.favoritesPokemons.contains(widget.pokemon)) {
                  return Icon(
                    Icons.star,
                    key: Key('isNotFavorite'),
                  );
                } else {
                  return Icon(
                    Icons.star_border,
                    key: Key('isFavorite'),
                  );
                }
              }),
            )
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
                          pathImage: '${widget.pokemon.sprites!.frontDefault}'),
                      CacheImageWidget(
                          pathImage: '${widget.pokemon.sprites!.backDefault}')
                    ]),
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
                ItemMenuPokemonWidget(
                  key: Key('menuStatsKey'),
                  label: 'Stats',
                  info: Info.STATS,
                  color: _info == Info.STATS ? colorPokemon : Colors.white,
                  borderColor: colorPokemon,
                  textColor: _info == Info.STATS ? Colors.white : colorPokemon,
                  onTap: () {
                    setState(() {
                      _info = Info.STATS;
                    });
                  },
                ),
                ItemMenuPokemonWidget(
                  key: Key('menuMovesKey'),
                  label: 'Moves',
                  info: Info.MOVES,
                  color: _info == Info.MOVES ? colorPokemon : Colors.white,
                  borderColor: colorPokemon,
                  textColor: _info == Info.MOVES ? Colors.white : colorPokemon,
                  onTap: () {
                    setState(() {
                      _info = Info.MOVES;
                    });
                  },
                ),
                ItemMenuPokemonWidget(
                  key: Key('menuDamageKey'),
                  label: 'Damage',
                  info: Info.DAMAGE,
                  color: _info == Info.DAMAGE ? colorPokemon : Colors.white,
                  borderColor: colorPokemon,
                  textColor: _info == Info.DAMAGE ? Colors.white : colorPokemon,
                  onTap: () {
                    setState(() {
                      _info = Info.DAMAGE;
                    });
                  },
                ),
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
}
