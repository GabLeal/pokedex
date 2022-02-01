// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonStore on _PokemonStoreBase, Store {
  final _$statusRequestAtom = Atom(name: '_PokemonStoreBase.statusRequest');

  @override
  StatusRequest get statusRequest {
    _$statusRequestAtom.reportRead();
    return super.statusRequest;
  }

  @override
  set statusRequest(StatusRequest value) {
    _$statusRequestAtom.reportWrite(value, super.statusRequest, () {
      super.statusRequest = value;
    });
  }

  final _$pokemonsAtom = Atom(name: '_PokemonStoreBase.pokemons');

  @override
  ObservableList<PokemonEntity> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonEntity> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$favoritesPokemonsAtom =
      Atom(name: '_PokemonStoreBase.favoritesPokemons');

  @override
  ObservableList<PokemonEntity> get favoritesPokemons {
    _$favoritesPokemonsAtom.reportRead();
    return super.favoritesPokemons;
  }

  @override
  set favoritesPokemons(ObservableList<PokemonEntity> value) {
    _$favoritesPokemonsAtom.reportWrite(value, super.favoritesPokemons, () {
      super.favoritesPokemons = value;
    });
  }

  final _$myTeamPokemonAtom = Atom(name: '_PokemonStoreBase.myTeamPokemon');

  @override
  ObservableList<PokemonEntity> get myTeamPokemon {
    _$myTeamPokemonAtom.reportRead();
    return super.myTeamPokemon;
  }

  @override
  set myTeamPokemon(ObservableList<PokemonEntity> value) {
    _$myTeamPokemonAtom.reportWrite(value, super.myTeamPokemon, () {
      super.myTeamPokemon = value;
    });
  }

  final _$getPokemonsAsyncAction = AsyncAction('_PokemonStoreBase.getPokemons');

  @override
  Future getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  @override
  String toString() {
    return '''
statusRequest: ${statusRequest},
pokemons: ${pokemons},
favoritesPokemons: ${favoritesPokemons},
myTeamPokemon: ${myTeamPokemon}
    ''';
  }
}
