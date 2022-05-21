import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/datasources/remote/type_damage/type_damage_datasource.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/data/repositories/type_damage_repository_imp.dart';

class TypeDamageDatasourceMock extends Mock implements TypeDamageDatasource {}

main() {
  final datasoureMock = TypeDamageDatasourceMock();

  final repository = TypeDamageRepositoryImp(datasoureMock);

  test('should return Typedamage', () async {
    when(() => datasoureMock.getTypeDamage(any()))
        .thenAnswer((_) async => Right(TypeDamage()));

    var result = await repository.getTypeDamage('any');

    expect(result.isRight, true);
  });
}
