import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/layers/domain/usercases/pokemon/pokemon_use_case.dart';

class PokemonUseCaseImp implements PokemonUseCase {
  late PokemonRepository _pokemonRepository;
  @override
  Future<List<PokemonEntity>> getPokemons() async {
    return await _pokemonRepository.getPokemons();
  }

  @override
  Future<PokemonEntity?> searchPokemonByName(String name) async {
    return _pokemonRepository.searchPokemonByName(name);
  }
}
