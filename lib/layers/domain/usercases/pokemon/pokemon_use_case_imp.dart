import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/layers/domain/usercases/pokemon/pokemon_use_case.dart';

class PokemonUseCaseImp implements PokemonUseCase {
  final PokemonRepository _pokemonRepository;

  PokemonUseCaseImp(this._pokemonRepository);
  @override
  Future<List<PokemonEntity>> getPokemons() async {
    return await _pokemonRepository.getPokemons();
  }

  @override
  Future<Either<Failure, PokemonEntity>> searchPokemonByName(
      String name) async {
    return await _pokemonRepository.searchPokemonByName(name);
  }
}
