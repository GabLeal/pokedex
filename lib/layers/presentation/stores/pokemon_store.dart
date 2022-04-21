import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:pokedex/cache/cache_favorites.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/usercases/my_team/my_team_use_case.dart';
import 'package:pokedex/layers/domain/usercases/pokemon/pokemon_use_case.dart';
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
  final MyTeamUseCase _myTeamUseCase;

  _PokemonStoreBase(
    this._pokemonUseCase,
    this._cacheFavorites,
    this._myTeamUseCase,
  );

  @observable
  StatusRequest statusRequest = StatusRequest.empty;

  @observable
  ObservableList<PokemonEntity> pokemons =
      ObservableList<PokemonEntity>().asObservable();

  @observable
  ObservableList<PokemonEntity> favoritesPokemons =
      ObservableList<PokemonEntity>().asObservable();

  @observable
  ObservableList<PokemonEntity> myTeamPokemon =
      ObservableList<PokemonEntity>().asObservable();
  // TODO: isso deve pegar de um caso de uso, que chama uma repository que chama um local DataBase
  getFavoritesPokemons() async {
    List<PokemonEntity> poke = await _cacheFavorites.getFavoritesPokemons();

    if (poke.isNotEmpty) {
      favoritesPokemons.addAll(poke);
    }
  }

  //TODO: teve ter um use case
  favoritePokemon(PokemonEntity pokemon) async {
    bool isSave = await _cacheFavorites.favoritePokemon(pokemon);
    if (isSave) favoritesPokemons.add(pokemon);
  }

  //TODO: teve ter um use case
  removeFavoritePokemon(PokemonEntity pokemon) async {
    bool isremove = await _cacheFavorites.removeFavoritePokemon(pokemon);
    if (isremove) {
      favoritesPokemons.removeWhere((p) => p.name == pokemon.name);
    }
  }

  //TODO: teve ter um use case
  addMyTeamPokemon(PokemonEntity pokemon) async {
    bool isSave = await _myTeamUseCase.add(pokemon);
    if (isSave) myTeamPokemon.add(pokemon);
  }

  //TODO: teve ter um use case
  removeMyTeamPokemon(PokemonEntity pokemon) async {
    bool isremove = await _myTeamUseCase.remove(pokemon.id!);
    if (isremove) {
      myTeamPokemon.removeWhere((p) => p.name == pokemon.name);
    }
  }

  //TODO: revisar
  bool pokemonIsMyTeam(idPokemon) {
    for (var pokemon in myTeamPokemon) {
      if (pokemon.id == idPokemon) return true;
    }
    return false;
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

  @action
  Future<void> getMyTeamPokemon() async {
    List<PokemonEntity> myTeam = await _myTeamUseCase.fetch();
    if (myTeam.isNotEmpty) myTeamPokemon.addAll(myTeam);
  }

  Future<PokemonEntity?> searchPokemonByName(String name) async {
    statusRequest = StatusRequest.loading;

    var result = await _pokemonUseCase.searchPokemonByName(name);

    return result.fold((error) {
      statusRequest = StatusRequest.success;

      BotToast.showText(
        duration: Duration(seconds: 3),
        text: error.message,
      ); //popup a text toast;

      return null;
    }, (success) {
      statusRequest = StatusRequest.success;
      return success;
    });
  }
}
