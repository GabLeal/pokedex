import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/layers/data/datasources/local/my_team/my_team_datasource_imp.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  late MyTeamDatasourceImp myTeamDatasourceMock;

  setUpAll(() {
    myTeamDatasourceMock = MyTeamDatasourceImp();
  });

  test('should retrieve favorite pokemons', () async {
    SharedPreferences.setMockInitialValues({
      'myTeam': jsonMyTeamPokemon,
    });

    List<PokemonEntity> pokemons = await myTeamDatasourceMock.fetch();

    expect(pokemons.length, 3);
  });

  test('should retrieve an empty favorite pokemon list', () async {
    SharedPreferences.setMockInitialValues({});

    List<PokemonEntity> pokemons = await myTeamDatasourceMock.fetch();

    expect(pokemons, isEmpty);
  });

  test('should remove pokemons from favorites', () async {
    SharedPreferences.setMockInitialValues({
      'myTeam': jsonMyTeamPokemon,
    });
    PokemonEntity pokemon = PokemonEntity(name: 'bulbasaur', id: 1);

    var result = await myTeamDatasourceMock.remove(pokemon.id!);
    List<PokemonEntity> pokemons = await myTeamDatasourceMock.fetch();
    expect(pokemons.length, 2);
    expect(result, true);
  });
}

var jsonMyTeamPokemon = '''
[{"height":null,"id":1,"location_area_encounters":null,"name":"bulbasaur","order":1,"sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png","back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"},"types":[{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}}],"weight":null},{"height":null,"id":9,"location_area_encounters":null,"name":"blastoise","order":12,"sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png","back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/9.png"},"types":[{"slot":1,"type":{"name":"water","url":"https://pokeapi.co/api/v2/type/11/"}}],"weight":null},{"height":null,"id":6,"location_area_encounters":null,"name":"charizard","order":7,"sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png","back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/6.png"},"types":[{"slot":1,"type":{"name":"fire","url":"https://pokeapi.co/api/v2/type/10/"}}],"weight":null}]
''';
