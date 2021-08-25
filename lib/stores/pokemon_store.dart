import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/cache/cache_favorites.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/util/enums.dart';
import 'package:bot_toast/bot_toast.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  late PokemonRepository _pokemonRepository;
  late CacheFavorites _cacheFavorites;

  _PokemonStoreBase(
      [PokemonRepository? repository, CacheFavorites? cacheFavorites]) {
    _pokemonRepository = repository ?? PokemonRepository(dio: Dio());
    _cacheFavorites = cacheFavorites ?? CacheFavorites();
  }

  @observable
  StatusRequest statusRequest = StatusRequest.empty;

  @observable
  ObservableList<Pokemon> pokemons = ObservableList<Pokemon>().asObservable();

  @observable
  ObservableList<Pokemon> favoritesPokemons =
      ObservableList<Pokemon>().asObservable();

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
    try {
      statusRequest = StatusRequest.loading;

      List<Pokemon> listPokemons = await _pokemonRepository.getPokemons();

      pokemons.addAll(listPokemons);
      statusRequest = StatusRequest.success;
    } catch (erro) {
      statusRequest = StatusRequest.error;
    }
  }

  Future<Pokemon?> searchPokemonByName(String name) async {
    statusRequest = StatusRequest.loading;

    Pokemon? pokemon = await _pokemonRepository.searchPokemonByName(name);

    if (pokemon != null) {
      statusRequest = StatusRequest.success;
      return pokemon;
    } else {
      statusRequest = StatusRequest.success;

      BotToast.showText(
          duration: Duration(seconds: 3),
          text: "Pokemon not found. Try again."); //popup a text toast;

      return null;
    }
  }
}
