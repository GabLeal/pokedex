import 'package:mobx/mobx.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/usecases/my_favorites/my_favorites_use_case.dart';
import 'package:pokedex/layers/domain/usecases/my_team/my_team_use_case.dart';
import 'package:pokedex/layers/domain/usecases/pokemon/pokemon_use_case.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final PokemonUseCase _pokemonUseCase;
  final MyTeamUseCase _myTeamUseCase;
  final MyFavoritesUseCase _myFavoritesUseCase;
  String erroMessageSeacrhPokemon = '';

  _PokemonStoreBase(
    this._pokemonUseCase,
    this._myTeamUseCase,
    this._myFavoritesUseCase,
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

  Future<void> getFavoritesPokemons() async {
    List<PokemonEntity> poke =
        await _myFavoritesUseCase.fetchFavoritesPokemons();

    if (poke.isNotEmpty) {
      favoritesPokemons.addAll(poke);
    }
  }

  Future<void> favoritePokemon(PokemonEntity pokemon) async {
    bool isSave = await _myFavoritesUseCase.favorite(pokemon);
    if (isSave) favoritesPokemons.add(pokemon);
  }

  Future<void> removeFavoritePokemon(PokemonEntity pokemon) async {
    bool isremove = await _myFavoritesUseCase.removeFavorite(pokemon);
    if (isremove) {
      favoritesPokemons.removeWhere((p) => p.name == pokemon.name);
    }
  }

  bool get pokemonTeamIsComplete {
    return myTeamPokemon.length == 6;
  }

  Future<void> addMyTeamPokemon(PokemonEntity pokemon) async {
    bool isSave = await _myTeamUseCase.add(
      pokemon,
    );
    if (isSave) myTeamPokemon.add(pokemon);
  }

  Future<void> removeMyTeamPokemon(PokemonEntity pokemon) async {
    bool isremove = await _myTeamUseCase.remove(pokemon.id!);
    if (isremove) {
      myTeamPokemon.removeWhere((p) => p.name == pokemon.name);
    }
  }

  bool pokemonIsInMyTeam(idPokemon) {
    for (var pokemon in myTeamPokemon) {
      if (pokemon.id == idPokemon) return true;
    }
    return false;
  }

  @action
  getPokemons() async {
    statusRequest = StatusRequest.loading;

    var result = await _pokemonUseCase.getPokemons();
    result.fold(
      (error) {
        statusRequest = StatusRequest.error;
      },
      (success) {
        pokemons.addAll(success);
        statusRequest = StatusRequest.success;
      },
    );
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
      statusRequest = StatusRequest.empty;
      erroMessageSeacrhPokemon = error.message;
      return null;
    }, (success) {
      statusRequest = StatusRequest.success;
      return success;
    });
  }
}
