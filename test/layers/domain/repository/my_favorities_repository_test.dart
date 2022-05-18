import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/datasources/local/my_favorities/my_favorites_datasorce.dart';
import 'package:pokedex/layers/data/repositories/my_favorites_repository_imp.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

class MyFavoritesDatasourceMock extends Mock implements MyFavoritesDatasource {}

void main() {
  final datasource = MyFavoritesDatasourceMock();
  final myFavoritesRepository = MyFavoritesRepositoryImp(datasource);

  setUpAll(() {
    registerFallbackValue(PokemonEntity());
  });

  group('[Repository] My favorities, body', () {
    test('should return true', () async {
      when(() => datasource.favorite(any())).thenAnswer((_) async => true);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myFavoritesRepository.favorite(pokemon);
      expect(result, true);
    });

    test('should return false', () async {
      when(() => datasource.favorite(any())).thenAnswer((_) async => false);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myFavoritesRepository.favorite(pokemon);
      expect(result, false);
    });

    test('should return false', () async {
      when(() => datasource.removeFavorite(any()))
          .thenAnswer((_) async => true);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myFavoritesRepository.removeFavorite(pokemon);
      expect(result, true);
    });
    test('should return false', () async {
      when(() => datasource.removeFavorite(any()))
          .thenAnswer((_) async => false);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myFavoritesRepository.removeFavorite(pokemon);
      expect(result, false);
    });

    test('should return false', () async {
      when(datasource.fetchFavoritesPokemons).thenAnswer((_) async => [
            PokemonEntity(),
            PokemonEntity(),
            PokemonEntity(),
          ]);

      var result = await myFavoritesRepository.fetchFavoritesPokemons();
      expect(result.length, 3);
      expect(result, isA<List<PokemonEntity>>());
    });
  });
}
