import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

abstract class PokemonUseCase {
  Future<List<PokemonEntity>> getPokemons();

  Future<PokemonEntity?> searchPokemonByName(String name);
}
