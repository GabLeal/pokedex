import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

abstract class MyTeamUseCase {
  Future<bool> add(PokemonEntity pokemon);
  Future<List<PokemonEntity>> fetch();
  Future<bool> remove(int idPokemon);
}
