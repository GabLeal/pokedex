import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/datasources/remote/ability/ability_datasource.dart';
import 'package:pokedex/layers/data/repositories/ability_repository_imp.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

class AbilityDetailsDatasourceMock extends Mock
    implements AbilityDetailsDatasource {}

main() {
  final datasource = AbilityDetailsDatasourceMock();

  final repository = AbilityDetailsRepositoryImp(datasource);
  var url = 'https://pokeapi.co/api/v2/ability/65/';

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
