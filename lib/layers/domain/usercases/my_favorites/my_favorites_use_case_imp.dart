import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/my_favorites_repository.dart';
import 'package:pokedex/layers/domain/usercases/my_favorites/my_favorites_use_case.dart';

class MyFavoritesUseCaseImp implements MyFavoritesUseCase {
  final MyFavoritesRepository _myFavoritesRepository;
  MyFavoritesUseCaseImp(this._myFavoritesRepository);
  @override
  Future<bool> favorite(PokemonEntity pokemon) async {
    return await _myFavoritesRepository.favorite(pokemon);
  }

  @override
  Future<List<PokemonEntity>> fetchFavoritesPokemons() async {
    return await _myFavoritesRepository.fetchFavoritesPokemons();
  }

  @override
  Future<bool> removeFavorite(PokemonEntity pokemon) async {
    return await _myFavoritesRepository.removeFavorite(pokemon);
  }
}
