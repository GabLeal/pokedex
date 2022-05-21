import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

import 'package:pokedex/layers/domain/repositories/my_team_repository.dart';
import 'package:pokedex/layers/domain/usecases/my_team/my_team_use_case_imp.dart';

class MyTeamRepositoryMock extends Mock implements MyTeamRepository {}

void main() {
  final repository = MyTeamRepositoryMock();
  final myTeamUsecase = MyTeamUseCaseImp(repository);

  setUpAll(() {
    registerFallbackValue(PokemonEntity());
  });

  group('[Repository] My favorities, body', () {
    test('should return true', () async {
      when(() => repository.add(any())).thenAnswer((_) async => true);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myTeamUsecase.add(pokemon);
      expect(result, true);
    });

    test('should return false', () async {
      when(() => repository.add(any())).thenAnswer((_) async => false);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myTeamUsecase.add(pokemon);
      expect(result, false);
    });

    test('should return false', () async {
      when(() => repository.remove(any())).thenAnswer((_) async => true);

      PokemonEntity pokemon = PokemonEntity(id: 0);
      var result = await myTeamUsecase.remove(pokemon.id!);
      expect(result, true);
    });
    test('should return false', () async {
      when(() => repository.remove(any())).thenAnswer((_) async => false);

      PokemonEntity pokemon = PokemonEntity(id: 0);
      var result = await myTeamUsecase.remove(pokemon.id!);
      expect(result, false);
    });

    test('should return false', () async {
      when(repository.fetch).thenAnswer((_) async => [
            PokemonEntity(),
            PokemonEntity(),
            PokemonEntity(),
          ]);

      var result = await myTeamUsecase.fetch();
      expect(result.length, 3);
      expect(result, isA<List<PokemonEntity>>());
    });
  });
}
