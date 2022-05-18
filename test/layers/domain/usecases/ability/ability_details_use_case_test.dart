import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/layers/domain/usercases/ability/ability_details_use_case_imp.dart';

class AbilityDetailsRepositoryMock extends Mock
    implements AbilityDetailsRepository {}

void main() {
  final repository = AbilityDetailsRepositoryMock();
  final abilityDetailsUseCase = AbilityDetailsUseCaseImp(repository);

  group('[USECASE ABILITY]', () {
    test('Deve retornar AbilityDetailsEntity', () async {
      when(() => repository.getAbilityDetails(any())).thenAnswer((_) async {
        return AbilityDetailsEntity();
      });

      var result = await abilityDetailsUseCase.getPokemonAbilityDetails('url');

      expect(result, isA<AbilityDetailsEntity>());
    });

    test('Deve retornar null', () async {
      when(() => repository.getAbilityDetails(any())).thenAnswer((_) async {
        return null;
      });

      var result = await abilityDetailsUseCase.getPokemonAbilityDetails('url');

      expect(result, isNull);
    });
  });
}
