import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/util/constants.dart';
import 'package:pokedex/layers/presentation/pages/my_team/my_team_pokemon_widget.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';
import 'package:pokedex/layers/presentation/themes/app_images.dart';

class MyTeamDetailsView extends StatefulWidget {
  MyTeamDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTeamDetailsView> createState() => _MyTeamDetailsViewState();
}

class _MyTeamDetailsViewState extends State<MyTeamDetailsView> {
  PokemonStore _pokemonStore = GetIt.I.get<PokemonStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child:
                Opacity(opacity: 0.25, child: Image.asset(AppImages.pokeball)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: defaultPadding),
              Text(
                "My team pokemon",
              ),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _pokemonStore.myTeamPokemon.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      child: MyTeamPokemonWidget(
                        pokemon: _pokemonStore.myTeamPokemon[index],
                      ),
                      onDismissed: (direction) {
                        _pokemonStore.removeMyTeamPokemon(
                          _pokemonStore.myTeamPokemon[index],
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
