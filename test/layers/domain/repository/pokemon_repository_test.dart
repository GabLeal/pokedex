import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/data/datasources/remote/pokemon/pokemon_datasource.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/data/repositories/pokemon_repository_imp.dart';

class PokemonDatasourceMock extends Mock implements PokemonDatasource {}

main() {
  final datasourceMock = PokemonDatasourceMock();

  final repository = PokemonRepositoryImp(datasourceMock);

  test('should return a list of 20 pokemons', () async {
    when(datasourceMock.getPokemons).thenAnswer(
      (_) async => Right([
        PokemonEntity(),
        PokemonEntity(),
        PokemonEntity(),
      ]),
    );

    var result = await repository.getPokemons();

    expect(result.isRight, true);
    expect(result.right.length, 3);
  });

  test('should return an empty pokemon list', () async {
    when(datasourceMock.getPokemons).thenAnswer(
      (_) async => Left(
        DatasourceFailure(),
      ),
    );

    var result = await repository.getPokemons();

    expect(result.isLeft, true);
    expect(result.left, isA<DatasourceFailure>());
  });

  test('should return pokemon with the given name.', () async {
    when(() => datasourceMock.searchPokemonByName(any())).thenAnswer(
      (_) async => Right(
        PokemonEntity(),
      ),
    );

    var pokemon = await repository.searchPokemonByName('pikachu');

    expect(pokemon.right, isA<PokemonEntity>());
  });

  test('should return a NotFound Failure error.', () async {
    when(() => datasourceMock.searchPokemonByName(any())).thenAnswer(
      (_) async => Left(
        PokemonNotFoundFailure(),
      ),
    );

    var pokemon = await repository.searchPokemonByName('pikachu');

    expect(pokemon.left, isA<PokemonNotFoundFailure>());
  });
  test('should return a DatasourceFailure Failure error.', () async {
    when(() => datasourceMock.searchPokemonByName(any())).thenAnswer(
      (_) async => Left(
        DatasourceFailure(),
      ),
    );

    var pokemon = await repository.searchPokemonByName('pikachu');

    expect(pokemon.left, isA<DatasourceFailure>());
  });
}
