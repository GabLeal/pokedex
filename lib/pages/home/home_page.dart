import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/shared/components/card_pokemon_widget.dart';
import 'package:pokedex/shared/components/loading.dart';

import 'package:pokedex/shared/components/loading_widget.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:pokedex/util/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonStore _pokemonStore = PokemonStore();
  var _controller = ScrollController();

  @override
  void initState() {
    _pokemonStore.getPokemons();

    // Setup the listener.
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          // You're at the top.
        } else {
          // You're at the bottom.
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // _logoPokeBall(size: size),
          // Container(
          //   child: Column(
          //     children: [
          //       Container(height: statusBar),
          //       Padding(
          //         padding:
          //             const EdgeInsets.symmetric(horizontal: 9.0, vertical: 50),
          //         child: Column(
          //           children: [
          //             Container(
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          //                 ],
          //               ),
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'Pokedex',
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 18),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          _listaPokemons(),
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
    );
  }

  Widget _listaPokemons() {
    return Observer(builder: (_) {
      switch (_pokemonStore.statusRequest) {
        case StatusRequest.error:
          return Container(
              child: ElevatedButton(
            child: Text("Tentar novamente"),
            onPressed: _pokemonStore.getPokemons,
          ));

        default:
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  var metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    if (metrics.pixels == 0)
                      print('At top');
                    else
                      _pokemonStore.getPokemons();
                  }
                  return true;
                },
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: _pokemonStore.pokemons.length,
                    itemBuilder: (context, index) {
                      var pokemon = _pokemonStore.pokemons[index];
                      return CarPokemonWidget(
                        pokemon: pokemon,
                      );
                    }),
              ));
      }
    });
  }

  Widget _logoPokeBall({required Size size}) {
    return Positioned(
        top: -(240 / 4.7),
        left: size.width - (240 / 1.6),
        child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              AppImages.blackPokeball,
              height: 240,
              width: 240,
            )));
  }
}
