import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/datasources/local/my_favorities/my_favorites_datasorce.dart';
import 'package:pokedex/layers/data/datasources/local/my_favorities/my_favorites_datasorce_imp.dart';
import 'package:pokedex/layers/domain/entities/abilities_entity.dart';
import 'package:pokedex/layers/domain/entities/ability_entity.dart';
import 'package:pokedex/layers/domain/entities/moves_entity.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/entities/sprites_entity.dart';
import 'package:pokedex/layers/domain/entities/stats_entity.dart';
import 'package:pokedex/layers/domain/entities/type_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../remote/pokemon/pokemon_datasource_test.dart';
import '../pokemon_entity_mock.dart';

class MyFavoritesDatasourceMock extends Mock implements MyFavoritesDatasource {}

main() {
  late MyFavoritesDatasourceImp myFavoritesDatasourceMock;

  setUpAll(() {
    myFavoritesDatasourceMock = MyFavoritesDatasourceImp();
  });

  test('should retrieve false when trying to add a pokemon. ', () async {
    SharedPreferences.setMockInitialValues({});

    var result = await myFavoritesDatasourceMock.favorite(pokemonEntityMock);

    expect(result, true);
  });

  test('should retrieve an empty favorite pokemon list', () async {
    SharedPreferences.setMockInitialValues({});

    List<PokemonEntity> pokemons =
        await myFavoritesDatasourceMock.fetchFavoritesPokemons();

    expect(pokemons, isEmpty);
  });
  test('should retrieve favorite pokemons', () async {
    SharedPreferences.setMockInitialValues({
      'pikachu': jsonEncode(jsonOnePokemon),
      'charmander': jsonEncode(jsonOnePokemon),
    });
    List<PokemonEntity> pokemons =
        await myFavoritesDatasourceMock.fetchFavoritesPokemons();

    expect(pokemons.length, 2);
  });

  test('should remove pokemons from favorites', () async {
    SharedPreferences.setMockInitialValues({
      'pikachu': jsonEncode(jsonOnePokemon),
      'charmander': jsonEncode(jsonOnePokemon),
    });
    PokemonEntity pokemon = PokemonEntity(name: 'pikachu');

    var result = await myFavoritesDatasourceMock.removeFavorite(pokemon);
    List<PokemonEntity> pokemons =
        await myFavoritesDatasourceMock.fetchFavoritesPokemons();
    expect(result, true);
    expect(pokemons.length, 1);
  });
}
