import 'package:pokedex/layers/data/datasources/local/my_favorities/my_favorites_datasorce.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/my_favorites_repository.dart';

class MyFavoritesRepositoryImp implements MyFavoritesRepository {
  final MyFavoritesDatasource _myFavoritesDatasource;
  MyFavoritesRepositoryImp(this._myFavoritesDatasource);
  @override
  Future<bool> favorite(PokemonEntity pokemon) async {
    return await _myFavoritesDatasource.favorite(pokemon);
  }

  @override
  Future<List<PokemonEntity>> fetchFavoritesPokemons() async {
    return await _myFavoritesDatasource.fetchFavoritesPokemons();
  }

  @override
  Future<bool> removeFavorite(PokemonEntity pokemon) async {
    return await _myFavoritesDatasource.removeFavorite(pokemon);
  }
}
