import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/datasources/remote/moves/move_datasource.dart';
import 'package:pokedex/layers/data/repositories/move_repository_imp.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

class MoveDatasourceMock extends Mock implements MoveDatasource {}

main() {
  final datasourceMock = MoveDatasourceMock();

  final repository = MoveDetailsRepositoryImp(datasourceMock);

  test('should return MoveDetails', () async {
    when(() => datasourceMock.getMoveDetails(any())).thenAnswer(
      (_) async => Right(MoveDetailsEntity()),
    );

    var result = await repository.getMoveDetails('any');

    expect(result.isRight, true);
    expect(result.right, isA<MoveDetailsEntity>());
  });
}
