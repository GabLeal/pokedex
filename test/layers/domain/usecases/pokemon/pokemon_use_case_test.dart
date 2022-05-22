import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/layers/domain/usecases/pokemon/pokemon_use_case_imp.dart';

class PokemonRepositoryeMock extends Mock implements PokemonRepository {}

main() {
  final repositoryMock = PokemonRepositoryeMock();

  final usecase = PokemonUseCaseImp(repositoryMock);

  test('should return a list of 3 pokemons', () async {
    when(repositoryMock.getPokemons).thenAnswer(
      (_) async => Right([
        PokemonEntity(),
        PokemonEntity(),
        PokemonEntity(),
      ]),
    );

    var result = await usecase.getPokemons();

    expect(result.isRight, true);
    expect(result.right.length, 3);
  });

  test('should return an empty pokemon list', () async {
    when(repositoryMock.getPokemons).thenAnswer(
      (_) async => Left(
        DatasourceFailure(),
      ),
    );

    var result = await usecase.getPokemons();

    expect(result.isLeft, true);
    expect(result.left, isA<DatasourceFailure>());
  });

  test('should return pokemon with the given name.', () async {
    when(() => repositoryMock.searchPokemonByName(any())).thenAnswer(
      (_) async => Right(
        PokemonEntity(),
      ),
    );

    var pokemon = await usecase.searchPokemonByName('pikachu');

    expect(pokemon.right, isA<PokemonEntity>());
  });

  test(
      'should return Failure with message Pokemon name cannot be empty, if name pokemon is empty.',
      () async {
    var pokemon = await usecase.searchPokemonByName('');

    expect(pokemon.isLeft, true);
    expect(pokemon.left, isA<Failure>());
    expect(pokemon.left.message, 'Pokemon name cannot be empty.');
  });

  test(
      'should return Failed message The pokemon name cannot be empty, if the pokemon name is a blank.',
      () async {
    var pokemon = await usecase.searchPokemonByName(' ');

    expect(pokemon.isLeft, true);
    expect(pokemon.left, isA<Failure>());
    expect(pokemon.left.message, 'Pokemon name cannot be empty.');
  });

  test('should return a NotFound Failure error.', () async {
    when(() => repositoryMock.searchPokemonByName(any())).thenAnswer(
      (_) async => Left(
        PokemonNotFoundFailure(),
      ),
    );

    var pokemon = await usecase.searchPokemonByName('pikachu');

    expect(pokemon.left, isA<PokemonNotFoundFailure>());
  });
  test('should return a DatasourceFailure Failure error.', () async {
    when(() => repositoryMock.searchPokemonByName(any())).thenAnswer(
      (_) async => Left(
        DatasourceFailure(),
      ),
    );

    var pokemon = await usecase.searchPokemonByName('pikachu');

    expect(pokemon.left, isA<DatasourceFailure>());
  });
}
