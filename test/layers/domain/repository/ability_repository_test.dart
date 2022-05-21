import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/data/datasources/remote/ability/ability_datasource.dart';
import 'package:pokedex/layers/data/repositories/ability_repository_imp.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

class AbilityDetailsDatasourceMock extends Mock
    implements AbilityDetailsDatasource {}

main() {
  final datasource = AbilityDetailsDatasourceMock();

  final repository = AbilityDetailsRepositoryImp(datasource);
  var url = 'https://pokeapi.co/api/v2/ability/65/';

  test('should return a NotFound Failure error.', () async {
    when(() => datasource.getAbilityDetails(any())).thenAnswer(
      (_) async => Left(
        NotFoundFailure(),
      ),
    );

    var result = await repository.getAbilityDetails(url);

    expect(result.isLeft, true);
    expect(result.left, isA<NotFoundFailure>());
  });
  test('should return a DatasourceFailure Failure error.', () async {
    when(() => datasource.getAbilityDetails(any())).thenAnswer(
      (_) async => Left(
        DatasourceFailure(),
      ),
    );

    var result = await repository.getAbilityDetails(url);

    expect(result.isLeft, true);
    expect(result.left, isA<DatasourceFailure>());
  });

  test('should return AbilityDetails', () async {
    when(() => datasource.getAbilityDetails(any())).thenAnswer(
      (_) async => Right(
        AbilityDetailsEntity(),
      ),
    );

    var result = await repository.getAbilityDetails(url);

    expect(result.isRight, true);
    expect(result.right, isA<AbilityDetailsEntity>());
  });
}
