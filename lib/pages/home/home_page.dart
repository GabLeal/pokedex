import 'package:flutter/material.dart';
import 'package:pokedex/pages/home/tab_favorites.dart';
import 'package:pokedex/pages/home/tab_pokemons.dart';
import 'package:pokedex/shared/components/app_bar_widget.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final pokemonStore = context.read<PokemonStore>();
    pokemonStore.getPokemons();
    pokemonStore.getFavoritesPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBarWidget(),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: <Widget>[TabPokemons(), TabFavorites()],
          )),
    );
  }
}
