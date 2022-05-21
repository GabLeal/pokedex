import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/layers/domain/usecases/ability/ability_details_use_case_imp.dart';

class AbilityDetailsRepositoryMock extends Mock
    implements AbilityDetailsRepository {}

void main() {
  final repository = AbilityDetailsRepositoryMock();
  final abilityDetailsUseCase = AbilityDetailsUseCaseImp(repository);

  group('[USECASE ABILITY]', () {
    test('Deve retornar AbilityDetailsEntity', () async {
      when(() => repository.getAbilityDetails(any())).thenAnswer((_) async {
        return Right(AbilityDetailsEntity());
      });

      var result = await abilityDetailsUseCase.getPokemonAbilityDetails('url');

      expect(result.isRight, true);
      expect(result.right, isA<AbilityDetailsEntity>());
    });

    test('Deve retornar null', () async {
      when(() => repository.getAbilityDetails(any())).thenAnswer((_) async {
        return Left(Failure('any'));
      });

      var result = await abilityDetailsUseCase.getPokemonAbilityDetails('url');

      expect(result.isLeft, true);
      expect(result.left, isA<Failure>());
    });
  });
}
