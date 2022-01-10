import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemons();

  Future<PokemonEntity?> searchPokemonByName(String name);
}
