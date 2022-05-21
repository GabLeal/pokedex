import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/domain/usercases/type_damage/type_damage_use_case.dart';
import 'package:pokedex/layers/presentation/stores/type_damage_store.dart';

class TypeDamageUseCaseMock extends Mock implements TypeDamageUseCase {}

main() {
  late TypeDamageUseCaseMock usecase;

  late TypeDamageStore store;

  setUpAll(() {
    usecase = TypeDamageUseCaseMock();
    store = TypeDamageStore(usecase);
  });

  var anyUrl = 'any';
  test('should return one typeDamage', () async {
    when(() => usecase.getTypeDamage(any())).thenAnswer((_) async {
      return Right(
        TypeDamage(),
      );
    });

    await store.getTypeDamage(anyUrl);
    expect(store.typeDamage, isNotNull);
    expect(store.statusRequestTypedamage, StatusRequest.success);
  });

  test('typeDamage must be null', () async {
    when(() => usecase.getTypeDamage(any())).thenAnswer((_) async {
      return Left(Failure(''));
    });

    await store.getTypeDamage(anyUrl);
    expect(store.typeDamage, isNull);
    expect(store.statusRequestTypedamage, StatusRequest.error);
  });
}
