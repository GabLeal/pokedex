import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/domain/repositories/type_damage_repository.dart';
import 'package:pokedex/layers/domain/usecases/type_damage/type_damage_use_case_imp.dart';

class TypeDamageRepositoryMock extends Mock implements TypeDamageRepository {}

main() {
  final repositoryMock = TypeDamageRepositoryMock();

  final usecase = TypeDamageUseCaseImp(repositoryMock);

  test('should return a NotFound Failure error.', () async {
    when(() => repositoryMock.getTypeDamage(any())).thenAnswer(
      (_) async => Left(
        NotFoundFailure(),
      ),
    );

    var result = await usecase.getTypeDamage('any');

    expect(result.isLeft, true);
    expect(result.left, isA<NotFoundFailure>());
  });
  test('should return a DatasourceFailure Failure error.', () async {
    when(() => repositoryMock.getTypeDamage(any())).thenAnswer(
      (_) async => Left(
        DatasourceFailure(),
      ),
    );

    var result = await usecase.getTypeDamage('any');

    expect(result.isLeft, true);
    expect(result.left, isA<DatasourceFailure>());
  });

  test('should return Typedamage', () async {
    when(() => repositoryMock.getTypeDamage(any()))
        .thenAnswer((_) async => Right(TypeDamage()));

    var result = await usecase.getTypeDamage('any');

    expect(result.isRight, true);
  });
}
