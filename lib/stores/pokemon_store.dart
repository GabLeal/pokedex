import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/cache/cache_favorites.dart';
import 'package:pokedex/layers/data/dto/pokemon_entity.dart';
import 'package:pokedex/layers/data/repositories/pokemon_repository_imp.dart';
import 'package:pokedex/layers/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/util/enums.dart';
import 'package:bot_toast/bot_toast.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  late PokemonRepository _pokemonRepository;
  late CacheFavorites _cacheFavorites;

  _PokemonStoreBase(
      [PokemonRepository? repository, CacheFavorites? cacheFavorites]) {
    _pokemonRepository = repository ?? PokemonRepositoryImp(dio: Dio());
    _cacheFavorites = cacheFavorites ?? CacheFavorites();
  }

  @observable
  StatusRequest statusRequest = StatusRequest.empty;

  @observable
  ObservableList<PokemonDto> pokemons =
      ObservableList<PokemonDto>().asObservable();

  @observable
  ObservableList<PokemonDto> favoritesPokemons =
      ObservableList<PokemonDto>().asObservable();

  getFavoritesPokemons() async {
    List<PokemonDto> poke = await _cacheFavorites.getFavoritesPokemons();

    if (poke.isNotEmpty) {
      favoritesPokemons.addAll(poke);
    }
  }

  favoritePokemon(PokemonDto pokemon) async {
    bool isSave = await _cacheFavorites.favoritePokemon(pokemon);
    if (isSave) favoritesPokemons.add(pokemon);
  }

  removeFavoritePokemon(PokemonDto pokemon) async {
    bool isremove = await _cacheFavorites.removeFavoritePokemon(pokemon);
    if (isremove) {
      favoritesPokemons.removeWhere((p) => p.name == pokemon.name);
    }
  }

  @action
  getPokemons() async {
    statusRequest = StatusRequest.loading;

    List<PokemonDto> listPokemons = await _pokemonRepository.getPokemons();

    if (listPokemons.isNotEmpty) {
      pokemons.addAll(listPokemons);
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.error;
    }
  }

  Future<PokemonDto?> searchPokemonByName(String name) async {
    statusRequest = StatusRequest.loading;

    PokemonDto? pokemon = await _pokemonRepository.searchPokemonByName(name);

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
