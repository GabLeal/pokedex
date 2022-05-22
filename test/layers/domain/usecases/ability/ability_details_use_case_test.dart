import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/layers/domain/usecases/ability/ability_details_use_case_imp.dart';

class AbilityDetailsRepositoryMock extends Mock
    implements AbilityDetailsRepository {}

void main() {
  final repository = AbilityDetailsRepositoryMock();
  final abilityDetailsUseCase = AbilityDetailsUseCaseImp(repository);

  group('[USECASE ABILITY]', () {
    test('should return a NotFound Failure error.', () async {
      when(() => repository.getAbilityDetails(any())).thenAnswer(
        (_) async => Left(
          NotFoundFailure(),
        ),
      );

      var result = await repository.getAbilityDetails('url');

      expect(result.isLeft, true);
      expect(result.left, isA<NotFoundFailure>());
    });
    test('should return a DatasourceFailure Failure error.', () async {
      when(() => repository.getAbilityDetails(any())).thenAnswer(
        (_) async => Left(
          DatasourceFailure(),
        ),
      );

      var result = await repository.getAbilityDetails('url');

      expect(result.isLeft, true);
      expect(result.left, isA<DatasourceFailure>());
    });

    test('Deve retornar AbilityDetailsEntity', () async {
      when(() => repository.getAbilityDetails(any())).thenAnswer((_) async {
        return Right(AbilityDetailsEntity());
      });

      var result = await abilityDetailsUseCase.getPokemonAbilityDetails('url');

      expect(result.isRight, true);
      expect(result.right, isA<AbilityDetailsEntity>());
    });
  });
}
