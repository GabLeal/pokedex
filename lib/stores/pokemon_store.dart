import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/cache/cache_favorites.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/util/base_url.dart';
import 'package:pokedex/util/enums.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  StatusRequest statusRequest = StatusRequest.empty;

  @observable
  ObservableList<Pokemon> pokemons = ObservableList<Pokemon>().asObservable();

  @observable
  ObservableList<Pokemon> favoritesPokemons =
      ObservableList<Pokemon>().asObservable();

  int _offset = 0;

  CacheFavorites _cacheFavorites = CacheFavorites();

  getFavoritesPokemons() async {
    List<Pokemon> poke = await _cacheFavorites.getFavoritesPokemons();

    if (poke.isNotEmpty) {
      favoritesPokemons.addAll(poke);
    }
  }

  favoritePokemon(Pokemon pokemon) async {
    bool isSave = await _cacheFavorites.favoritePokemon(pokemon);
    if (isSave) favoritesPokemons.add(pokemon);
  }

  removeFavoritePokemon(Pokemon pokemon) async {
    bool isremove = await _cacheFavorites.removeFavoritePokemon(pokemon);
    if (isremove) {
      favoritesPokemons.removeWhere((p) => p.name == pokemon.name);
    }
  }

  @action
  getPokemons() async {
    Dio dio = Dio();
    Response response;
    try {
      statusRequest = StatusRequest.loading;
      response = await dio
          .get('${BaseUrl.url}/pokemon/?offset=${_offset.toString()}&limit=20');

      List listaPokemons = response.data['results'];

      for (int i = 0; i < listaPokemons.length; i++) {
        await loadingPokemon(listaPokemons[i]['url']);
      }
      _offset += 20;
      statusRequest = StatusRequest.success;
    } catch (erro) {
      statusRequest = StatusRequest.error;
      print(erro);
    }
  }

  Future<void> loadingPokemon(String urlPokemon) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get(urlPokemon);

      var pokemonResponse = response.data;

      Pokemon pokemon = Pokemon.fromJson(pokemonResponse);
      pokemons.add(pokemon);
    } catch (erro) {
      statusRequest = StatusRequest.error;
      print(erro);
    }
  }

  Future<Pokemon?> searchPokemonByName(String name) async {
    statusRequest = StatusRequest.loading;
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get('${BaseUrl.url}/pokemon/$name');

      var pokemonResponse = response.data;

      Pokemon pokemon = Pokemon.fromJson(pokemonResponse);
      // pokemons.add(pokemon);
      statusRequest = StatusRequest.success;
      return pokemon;
    } catch (erro) {
      statusRequest = StatusRequest.success;
      print(erro);
      return null;
    }
  }
}
