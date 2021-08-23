import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/shared/components/app_bar_widget.dart';
import 'package:pokedex/shared/components/card_pokemon_widget.dart';
import 'package:pokedex/shared/components/loading.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:pokedex/util/enums.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _controller = ScrollController();

  @override
  void initState() {
    final pokemonStore = context.read<PokemonStore>();

    pokemonStore.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PokemonStore _pokemonStore = Provider.of<PokemonStore>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBarWidget(),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  _listaPokemons(_pokemonStore),
                  Observer(builder: (_) {
                    if (_pokemonStore.statusRequest == StatusRequest.loading) {
                      return Container(
                        height: size.height,
                        width: size.width,
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Loading(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })
                ],
              ),
              Text("Segunda guia selecionada")
            ],
          )),
    );
  }

  Widget _listaPokemons(PokemonStore pokemonStore) {
    return Observer(builder: (_) {
      switch (pokemonStore.statusRequest) {
        case StatusRequest.error:
          return Container(
              child: ElevatedButton(
            child: Text("Tentar novamente"),
            onPressed: pokemonStore.getPokemons,
          ));

        default:
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  var metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    if (metrics.pixels != 0) pokemonStore.getPokemons();
                  }
                  return true;
                },
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: pokemonStore.pokemons.length,
                    itemBuilder: (context, index) {
                      var pokemon = pokemonStore.pokemons[index];
                      return CarPokemonWidget(
                        pokemon: pokemon,
                      );
                    }),
              ));
      }
    });
  }
}
