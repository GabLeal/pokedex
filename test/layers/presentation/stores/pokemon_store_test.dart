import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/data/dto/pokemon_dto.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/usecases/my_favorites/my_favorites_use_case.dart';
import 'package:pokedex/layers/domain/usecases/my_team/my_team_use_case.dart';
import 'package:pokedex/layers/domain/usecases/pokemon/pokemon_use_case.dart';
import 'package:pokedex/layers/presentation/stores/pokemon_store.dart';

import '../../data/datasources/local/pokemon_entity_mock.dart';

class PokemonUseCaseMock extends Mock implements PokemonUseCase {}

class MyTeamUseCaseMock extends Mock implements MyTeamUseCase {}

class MyFavoritesUseCaseMock extends Mock implements MyFavoritesUseCase {}

main() {
  late PokemonUseCaseMock pokemonUseCase;
  late MyTeamUseCaseMock myTeamUseCase;
  late MyFavoritesUseCaseMock myFavoritesUseCase;

  late PokemonStore store;
  setUp(() {
    pokemonUseCase = PokemonUseCaseMock();
    myTeamUseCase = MyTeamUseCaseMock();
    myFavoritesUseCase = MyFavoritesUseCaseMock();
    store = PokemonStore(
      pokemonUseCase,
      myTeamUseCase,
      myFavoritesUseCase,
    );
  });

  setUpAll(() {
    registerFallbackValue(pokemonEntityMock);
  });
  group('[Presentation] Pokemons API', () {
    test('should keep the list empty when returning an error.', () async {
      when(() => pokemonUseCase.getPokemons()).thenAnswer(
        (_) async => Left(Failure('')),
      );
      await store.getPokemons();

      expect(store.pokemons, isEmpty);
      expect(store.statusRequest, StatusRequest.error);
    });
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
          ],
        ),
      );

      await store.getPokemons();
      expect(store.pokemons, isNotEmpty);
      expect(store.pokemons.length, 3);
      expect(store.statusRequest, StatusRequest.success);
    });

    // test('should return null when not finding the searched pokemon ', () async {
    //   when(
    //     () => pokemonUseCase.searchPokemonByName(
    //       any(),
    //     ),
    //   ).thenAnswer(
    //     (_) async => Left(
    //       Failure(''),
    //     ),
    //   );

    //   var result = await store.searchPokemonByName('anyNamePokemon');
    //   expect(result, null);
    // });

    test('should return pokemonEntity when finding the searched pokemon ',
        () async {
      when(
        () => pokemonUseCase.searchPokemonByName(
          any(),
        ),
      ).thenAnswer((_) async => Right(pokemonEntityMock));

      var result = await store.searchPokemonByName('anyNamePokemon');

      expect(result, isNotNull);
      expect(store.statusRequest, StatusRequest.success);
      expect(result, isA<PokemonEntity>());
    });
  });

  group('[Presentation] Pokemons My Favorites', () {
    test(
        'should return an empty pokemon list when call fetchFavoritesPokemons.',
        () async {
      when(myFavoritesUseCase.fetchFavoritesPokemons)
          .thenAnswer((_) async => <PokemonEntity>[]);
      await store.getFavoritesPokemons();

      expect(store.favoritesPokemons.isEmpty, true);
    });

    test(
        'should return an empty pokemon list when call fetchFavoritesPokemons.',
        () async {
      when(myFavoritesUseCase.fetchFavoritesPokemons)
          .thenAnswer((_) async => <PokemonEntity>[
                PokemonDto(),
                PokemonDto(),
                PokemonDto(),
              ]);
      await store.getFavoritesPokemons();

      expect(store.favoritesPokemons.isNotEmpty, true);
      expect(store.favoritesPokemons.length, 3);
    });

    test('should not add favorite pokemon in the list.', () async {
      when(() => myFavoritesUseCase.favorite(any())).thenAnswer(
        (_) async => false,
      );

      await store.favoritePokemon(pokemonEntityMock);

      expect(store.favoritesPokemons.isEmpty, true);
    });

    test('should add favorite pokemon in the list', () async {
      when(() => myFavoritesUseCase.favorite(any())).thenAnswer(
        (_) async => true,
      );

      expect(store.favoritesPokemons, isEmpty);

      await store.favoritePokemon(pokemonEntityMock);

      expect(store.favoritesPokemons.isNotEmpty, true);
      expect(store.favoritesPokemons.length, 1);
    });

    test('should not remove favorite pokemon in the list.', () async {
      when(() => myFavoritesUseCase.removeFavorite(any())).thenAnswer(
        (_) async => false,
      );
      store.favoritesPokemons.add(pokemonEntityMock);

      await store.removeFavoritePokemon(pokemonEntityMock);

      expect(store.favoritesPokemons.isNotEmpty, true);
      expect(store.favoritesPokemons.length, 1);
    });

    test('should remove favorite pokemon in the list', () async {
      when(() => myFavoritesUseCase.removeFavorite(any())).thenAnswer(
        (_) async => true,
      );
      store.favoritesPokemons.add(pokemonEntityMock);
      expect(store.favoritesPokemons.length, 1);

      await store.removeFavoritePokemon(pokemonEntityMock);

      expect(store.favoritesPokemons.length, 0);
    });
  });

  group('[Presentation] Pokemons My Team', () {
    test('should return an empty pokemon list when call my team pokemon.',
        () async {
      when(myTeamUseCase.fetch).thenAnswer(
        (_) async => <PokemonEntity>[],
      );
      await store.getMyTeamPokemon();

      expect(store.myTeamPokemon.isEmpty, true);
    });

    test('should return 3 pokemons when call my team pokemon.', () async {
      when(myTeamUseCase.fetch).thenAnswer((_) async => <PokemonEntity>[
            PokemonDto(),
            PokemonDto(),
            PokemonDto(),
          ]);
      await store.getMyTeamPokemon();

      expect(store.myTeamPokemon.isNotEmpty, true);
      expect(store.myTeamPokemon.length, 3);
    });

    test('should not add pokemon in the my team list.', () async {
      when(() => myTeamUseCase.add(any())).thenAnswer(
        (_) async => false,
      );

      await store.addMyTeamPokemon(pokemonEntityMock);

      expect(store.myTeamPokemon.isEmpty, true);
    });

    test('should addpokemon in the my team list', () async {
      when(() => myTeamUseCase.add(any())).thenAnswer(
        (_) async => true,
      );

      expect(store.favoritesPokemons, isEmpty);

      await store.addMyTeamPokemon(pokemonEntityMock);

      expect(store.myTeamPokemon.isNotEmpty, true);
      expect(store.myTeamPokemon.length, 1);
    });

    test('should not remove pokemon in the my team list.', () async {
      when(() => myTeamUseCase.remove(any())).thenAnswer(
        (_) async => false,
      );
      store.myTeamPokemon.add(pokemonEntityMock);

      await store.removeMyTeamPokemon(pokemonEntityMock);

      expect(store.myTeamPokemon.isNotEmpty, true);
      expect(store.myTeamPokemon.length, 1);
    });

    test('should remove pokemon in the my team list', () async {
      when(() => myTeamUseCase.remove(any())).thenAnswer(
        (_) async => true,
      );
      store.myTeamPokemon.add(pokemonEntityMock);
      expect(store.myTeamPokemon.length, 1);

      await store.removeMyTeamPokemon(pokemonEntityMock);

      expect(store.myTeamPokemon.length, 0);
    });
  });
}
