import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/dto/pokemon_dto.dart';
import 'package:pokedex/layers/domain/usercases/my_favorites/my_favorites_use_case.dart';
import 'package:pokedex/layers/domain/usercases/my_team/my_team_use_case.dart';
import 'package:pokedex/layers/domain/usercases/pokemon/pokemon_use_case.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';

class PokemonUseCaseMock extends Mock implements PokemonUseCase {}

class MyTeamUseCaseMock extends Mock implements MyTeamUseCase {}

class MyFavoritesUseCaseMock extends Mock implements MyFavoritesUseCase {}

main() {
  final pokemonUseCase = PokemonUseCaseMock();
  final myTeamUseCase = MyTeamUseCaseMock();
  final myFavoritesUseCase = MyFavoritesUseCaseMock();

  final store = PokemonStore(
    pokemonUseCase,
    myTeamUseCase,
    myFavoritesUseCase,
  );

  group('API Pokemons', () {
    test('should return an empty pokemon list', () async {
      when(() => pokemonUseCase.getPokemons()).thenAnswer(
        (_) async => Right([]),
      );
      await store.getPokemons();

      expect(store.pokemons, isEmpty);
    });
    test('should fill Pokemon list', () async {
      when(() => pokemonUseCase.getPokemons()).thenAnswer(
        (_) async => Right(
          <PokemonDto>[
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
          ],
        ),
      );

      await store.getPokemons();
      expect(store.pokemons, isNotEmpty);
      expect(store.pokemons.length, 20);
    });
  });
}
