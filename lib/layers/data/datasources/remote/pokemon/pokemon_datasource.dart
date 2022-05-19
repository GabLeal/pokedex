import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

abstract class PokemonDatasource {
  Future<Either<Failure,List<PokemonEntity>>> getPokemons();

  Future<Either<Failure, PokemonEntity>> searchPokemonByName(String name);
}
