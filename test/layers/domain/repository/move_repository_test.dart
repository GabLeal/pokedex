import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/data/datasources/remote/moves/move_datasource.dart';
import 'package:pokedex/layers/data/repositories/move_repository_imp.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

class MoveDatasourceMock extends Mock implements MoveDatasource {}

main() {
  final datasourceMock = MoveDatasourceMock();

  final repository = MoveDetailsRepositoryImp(datasourceMock);

  test('should return a NotFound Failure error.', () async {
    when(() => datasourceMock.getMoveDetails(any())).thenAnswer(
      (_) async => Left(
        NotFoundFailure(),
      ),
    );

    var result = await repository.getMoveDetails('any');

    expect(result.isLeft, true);
    expect(result.left, isA<NotFoundFailure>());
  });
  test('should return a DatasourceFailure Failure error.', () async {
    when(() => datasourceMock.getMoveDetails(any())).thenAnswer(
      (_) async => Left(
        DatasourceFailure(),
      ),
    );

    var result = await repository.getMoveDetails('any');

    expect(result.isLeft, true);
    expect(result.left, isA<DatasourceFailure>());
  });
  test('should return MoveDetails', () async {
    when(() => datasourceMock.getMoveDetails(any())).thenAnswer(
      (_) async => Right(MoveDetailsEntity()),
    );

    var result = await repository.getMoveDetails('any');

    expect(result.isRight, true);
    expect(result.right, isA<MoveDetailsEntity>());
  });
}
