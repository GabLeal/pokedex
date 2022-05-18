import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/util/constants.dart';
import 'package:pokedex/layers/presentation/pages/home/pokeball_home_transition.dart';
import 'package:pokedex/layers/presentation/pages/my_team/my_team_details_view.dart';
import 'package:pokedex/layers/presentation/pages/my_team/my_team_short_widget.dart';
import 'package:pokedex/layers/presentation/components/app_bar_widget.dart';
import 'package:pokedex/layers/presentation/stores/controller_animation.dart';
import 'package:pokedex/layers/presentation/pages/home/tab_favorites.dart';
import 'package:pokedex/layers/presentation/pages/home/tab_pokemons.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllerAnimation = ControllerAnimation();
  final pokemonStore = GetIt.I.get<PokemonStore>();

  @override
  void initState() {
    pokemonStore.getPokemons();
    pokemonStore.getFavoritesPokemons();
    pokemonStore.getMyTeamPokemon();
    super.initState();
  }

  late double layoutHeight;
  late double fullHeight;

  double get _heightAnimation {
    if (_controllerAnimation.homeState == HomeState.normal) return 0;
    return fullHeight - layoutHeight + cartBarHeight;
  }

  @override
  Widget build(BuildContext context) {
    fullHeight = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: _controllerAnimation,
      builder: (context, _) {
        return Stack(
          children: [
            DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBarWidget(),
                body: LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    layoutHeight = constraints.maxHeight;
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          duration: defaultTimeTransition,
                          top: 0,
                          left: 0,
                          right: 0,
                          height: constraints.maxHeight - cartBarHeight,
                          child: TabBarView(
                            children: <Widget>[
                              TabPokemons(),
                              TabFavorites(),
                            ],
                          ),
                        ),
                        AnimatedPositioned(
                          duration: defaultTimeTransition,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height:
                              _controllerAnimation.homeState == HomeState.normal
                                  ? cartBarHeight
                                  : (constraints.maxHeight - cartBarHeight),
                          child: GestureDetector(
                            onVerticalDragUpdate:
                                _controllerAnimation.onVerticalGesture,
                            child: AnimatedSwitcher(
                              duration: defaultTimeTransition,
                              child: _controllerAnimation.homeState ==
                                      HomeState.normal
                                  ? MyTeamShortWidget()
                                  : MyTeamDetailsView(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            AnimatedPositioned(
              duration: defaultTimeTransition,
              top: 0,
              left: 0,
              right: 0,
              height: _heightAnimation,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            PokeballHomeTransition()
          ],
        );
      },
    );
  }
}
