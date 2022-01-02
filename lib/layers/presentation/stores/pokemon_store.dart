import 'package:mobx/mobx.dart';
import 'package:pokedex/cache/cache_favorites.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/usercases/pokemon/pokemon_use_case.dart';
import 'package:pokedex/util/enums.dart';
import 'package:bot_toast/bot_toast.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  // late PokemonRepository _pokemonRepository;
  // late CacheFavorites _cacheFavorites;

  // _PokemonStoreBase(
  //     [PokemonRepository? repository, CacheFavorites? cacheFavorites]) {
  //   _pokemonRepository = repository ?? PokemonRepositoryImp(dio: Dio());
  //   _cacheFavorites = cacheFavorites ?? CacheFavorites();
  // }

  final PokemonUseCase _pokemonUseCase;
  final CacheFavorites _cacheFavorites;

  _PokemonStoreBase(this._pokemonUseCase, this._cacheFavorites);

  @observable
  StatusRequest statusRequest = StatusRequest.empty;

  @observable
  ObservableList<PokemonEntity> pokemons =
      ObservableList<PokemonEntity>().asObservable();

  @observable
  ObservableList<PokemonEntity> favoritesPokemons =
      ObservableList<PokemonEntity>().asObservable();

  getFavoritesPokemons() async {
    List<PokemonEntity> poke = await _cacheFavorites.getFavoritesPokemons();

    if (poke.isNotEmpty) {
      favoritesPokemons.addAll(poke);
    }
  }

  favoritePokemon(PokemonEntity pokemon) async {
    bool isSave = await _cacheFavorites.favoritePokemon(pokemon);
    if (isSave) favoritesPokemons.add(pokemon);
  }

  removeFavoritePokemon(PokemonEntity pokemon) async {
    bool isremove = await _cacheFavorites.removeFavoritePokemon(pokemon);
    if (isremove) {
      favoritesPokemons.removeWhere((p) => p.name == pokemon.name);
    }
  }

  @action
  getPokemons() async {
    statusRequest = StatusRequest.loading;

    List<PokemonEntity> listPokemons = await _pokemonUseCase.getPokemons();

    if (listPokemons.isNotEmpty) {
      pokemons.addAll(listPokemons);
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.error;
    }
  }

  Future<PokemonEntity?> searchPokemonByName(String name) async {
    statusRequest = StatusRequest.loading;

    PokemonEntity? pokemon = await _pokemonUseCase.searchPokemonByName(name);

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
