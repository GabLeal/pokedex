import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/data/datasources/remote/pokemon/pokemon_datasource.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImp implements PokemonRepository {
  PokemonDatasource _pokemonDatasource;

  PokemonRepositoryImp(this._pokemonDatasource);

  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemons() async {
    try {
      var result = _pokemonDatasource.getPokemons();
      return result;
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> searchPokemonByName(
    String name,
  ) async {
    try {
      var result = await _pokemonDatasource.searchPokemonByName(name);

      return result;
    } catch (_) {
      return Left(PokemonNotFoundFailure());
    }
  }
}
