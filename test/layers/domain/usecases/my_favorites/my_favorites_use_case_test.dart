import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/my_favorites_repository.dart';
import 'package:pokedex/layers/domain/usecases/my_favorites/my_favorites_use_case_imp.dart';

class MyFavoritesRepositoryMock extends Mock implements MyFavoritesRepository {}

void main() {
  final repository = MyFavoritesRepositoryMock();
  final myFavoritesUsecase = MyFavoritesUseCaseImp(repository);

  setUpAll(() {
    registerFallbackValue(PokemonEntity());
  });

  group('[Repository] My favorities, body', () {
    test('should return true', () async {
      when(() => repository.favorite(any())).thenAnswer((_) async => true);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myFavoritesUsecase.favorite(pokemon);
      expect(result, true);
    });

    test('should return false', () async {
      when(() => repository.favorite(any())).thenAnswer((_) async => false);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myFavoritesUsecase.favorite(pokemon);
      expect(result, false);
    });

    test('should return false', () async {
      when(() => repository.removeFavorite(any()))
          .thenAnswer((_) async => true);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myFavoritesUsecase.removeFavorite(pokemon);
      expect(result, true);
    });
    test('should return false', () async {
      when(() => repository.removeFavorite(any()))
          .thenAnswer((_) async => false);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myFavoritesUsecase.removeFavorite(pokemon);
      expect(result, false);
    });

    test('should return false', () async {
      when(repository.fetchFavoritesPokemons).thenAnswer((_) async => [
            PokemonEntity(),
            PokemonEntity(),
            PokemonEntity(),
          ]);

      var result = await myFavoritesUsecase.fetchFavoritesPokemons();
      expect(result.length, 3);
      expect(result, isA<List<PokemonEntity>>());
    });
  });
}
