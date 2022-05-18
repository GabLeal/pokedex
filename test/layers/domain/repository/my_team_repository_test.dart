import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/datasources/local/my_team/my_team_datasorce.dart';
import 'package:pokedex/layers/data/repositories/my_team_repository_imp.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

class MyTeamDatasourceMock extends Mock implements MyTeamDatasource {}

void main() {
  final datasource = MyTeamDatasourceMock();
  final myTeamRepository = MyTeamRepositoryImp(datasource);

  setUpAll(() {
    registerFallbackValue(PokemonEntity());
  });

  group('[Repository] My team', () {
    test('should return true', () async {
      when(() => datasource.add(any())).thenAnswer((_) async => true);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myTeamRepository.add(pokemon);
      expect(result, true);
    });

    test('should return false', () async {
      when(() => datasource.add(any())).thenAnswer((_) async => false);

      PokemonEntity pokemon = PokemonEntity();
      var result = await myTeamRepository.add(pokemon);
      expect(result, false);
    });

    test('should return false', () async {
      when(() => datasource.remove(any())).thenAnswer((_) async => true);

      PokemonEntity pokemon = PokemonEntity(id: 0);
      var result = await myTeamRepository.remove(pokemon.id!);
      expect(result, true);
    });
    test('should return false', () async {
      when(() => datasource.remove(any())).thenAnswer((_) async => false);

      PokemonEntity pokemon = PokemonEntity(id: 0);
      var result = await myTeamRepository.remove(pokemon.id!);
      expect(result, false);
    });

    test('should return false', () async {
      when(datasource.fetch).thenAnswer((_) async => [
            PokemonEntity(),
            PokemonEntity(),
            PokemonEntity(),
          ]);

      var result = await myTeamRepository.fetch();
      expect(result.length, 3);
      expect(result, isA<List<PokemonEntity>>());
    });
  });
}
