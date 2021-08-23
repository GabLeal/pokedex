import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/shared/components/card_pokemon_widget.dart';
import 'package:pokedex/shared/components/loading.dart';
import 'package:pokedex/stores/pokemon_store.dart';
import 'package:pokedex/util/enums.dart';

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
    super.initState();
  }

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search pokemon...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white60, fontSize: 13.0),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onSubmitted: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });

    _pokemonStore.searchPokemonByName(newQuery.toLowerCase());
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              leading: _isSearching ? const BackButton() : Container(),
              title: _isSearching ? _buildSearchField() : Text('Pokedex'),
              actions: _buildActions(),
              backgroundColor: Color(0xFFFF0000),
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelPadding: EdgeInsets.only(bottom: 10, top: 10),
                tabs: <Widget>[
                  Text("Pokemons"),
                  Text("Favoritos"),
                ],
              )),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
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
              Text("Segunda guia selecionada")
            ],
          )),
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
                    if (metrics.pixels != 0) _pokemonStore.getPokemons();
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
}
