import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/cache/cache_favorites.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/stores/pokemon_store.dart';

class PokemonRepositoryMock extends Mock implements PokemonRepository {}

class CacheFavoritesMock extends Mock implements CacheFavorites {}

main() {
  final repository = PokemonRepositoryMock();
  final cacheFavorites = CacheFavoritesMock();

  final store = PokemonStore(repository, cacheFavorites);

  group('Cache favorites pokemons', () {
    test('deve adicionar um pokemon aos favoritos', () {
      Pokemon pokemon = Pokemon();
      when(() => cacheFavorites.favoritePokemon(pokemon))
          .thenAnswer((_) async => Future.value(true));

      store.favoritePokemon(pokemon);

      expect(store.favoritesPokemons, isEmpty);
    });
  });

  group('API Pokemons', () {
    test('should return an empty pokemon list', () async {
      when(() => repository.getPokemons()).thenAnswer((_) async => []);
      await store.getPokemons();

      expect(store.pokemons, isEmpty);
    });
    test('should fill Pokemon list', () async {
      when(() => repository.getPokemons()).thenAnswer((_) async => <Pokemon>[
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
            Pokemon(),
          ]);

      await store.getPokemons();
      expect(store.pokemons, isNotEmpty);
      expect(store.pokemons.length, 20);
    });
  });
}
