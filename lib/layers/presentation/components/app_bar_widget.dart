import 'package:flutter/material.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/presentation/pages/pokemon/info_pokemon_page.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight + 30),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
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
            if (_searchQueryController.text.isEmpty) {
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

  void updateSearchQuery(String newQuery) async {
    setState(() {
      searchQuery = newQuery;
    });
    final pokemonStore = context.read<PokemonStore>();

    PokemonEntity? pokemon =
        await pokemonStore.searchPokemonByName(newQuery.toLowerCase());

    if (pokemon != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InfoPokemonPage(
                    pokemon: pokemon,
                  )));
    }
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            Text("Favorites"),
          ],
        ));
  }
}
