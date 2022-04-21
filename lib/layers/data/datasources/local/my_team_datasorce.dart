import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

abstract class MyTeamDatasource {
  Future<bool> add(PokemonEntity pokemon);
  Future<List<PokemonEntity>> fetch();
  Future<bool> remove(int idPokemon);
}
