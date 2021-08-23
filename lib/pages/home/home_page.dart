import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/pages/home/tab_favorites.dart';
import 'package:pokedex/pages/home/tab_pokemons.dart';
import 'package:pokedex/shared/components/app_bar_widget.dart';
import 'package:pokedex/shared/components/grid_pokemons_widget.dart';
import 'package:pokedex/shared/components/loading.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:pokedex/util/enums.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
