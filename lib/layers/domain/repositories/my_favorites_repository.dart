import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

abstract class MyFavoritesRepository {
  Future<bool> favorite(PokemonEntity pokemon);
  Future<List<PokemonEntity>> fetchFavoritesPokemons();
  Future<bool> removeFavorite(PokemonEntity pokemon);
}
