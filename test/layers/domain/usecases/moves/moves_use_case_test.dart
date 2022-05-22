import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';
import 'package:pokedex/layers/domain/usecases/moves/moves_use_case_imp.dart';

class MoveDetailsRepositoryMock extends Mock implements MoveDetailsRepository {}

void main() {
  final repository = MoveDetailsRepositoryMock();
  final moveDetailsUseCase = MovesUseCaseImp(repository);

  group('[USECASE MOVES DETAILS]', () {
    test('should return a NotFound Failure error.', () async {
      when(() => repository.getMoveDetails(any())).thenAnswer(
        (_) async => Left(
          NotFoundFailure(),
        ),
      );

      var result = await repository.getMoveDetails('any');

      expect(result.isLeft, true);
      expect(result.left, isA<NotFoundFailure>());
    });
    test('should return a DatasourceFailure Failure error.', () async {
      when(() => repository.getMoveDetails(any())).thenAnswer(
        (_) async => Left(
          DatasourceFailure(),
        ),
      );

      var result = await repository.getMoveDetails('any');

      expect(result.isLeft, true);
      expect(result.left, isA<DatasourceFailure>());
    });
    test('Deve retornar MoveDetailsEntity', () async {
      when(() => repository.getMoveDetails(any())).thenAnswer((_) async {
        return Right(MoveDetailsEntity());
      });

      var result = await moveDetailsUseCase.getMoveDetails('url');

      expect(result.isRight, true);
      expect(result.right, isA<MoveDetailsEntity>());
    });
  });
}
