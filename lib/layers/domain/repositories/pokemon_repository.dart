import 'package:pokedex/layers/data/dto/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonDto>> getPokemons();

  Future<PokemonDto?> searchPokemonByName(String name);
}
