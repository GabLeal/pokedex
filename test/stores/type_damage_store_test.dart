import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/domain/repositories/type_damage_repository.dart';
import 'package:pokedex/layers/domain/usercases/type_damage/type_damage_use_case.dart';
import 'package:pokedex/layers/domain/usercases/type_damage/type_damage_use_case_imp.dart';
import 'package:pokedex/layers/presentation/stores/type_damage_store.dart';

class TypeDamageRepositoryMock extends Mock implements TypeDamageRepository {}

main() {
  GetIt getIt = GetIt.instance;

  getIt.registerLazySingleton<TypeDamageRepository>(
    () => TypeDamageRepositoryMock(),
  );

  getIt.registerLazySingleton<TypeDamageUseCase>(
    () => TypeDamageUseCaseImp(
      getIt.get<TypeDamageRepository>(),
    ),
  );

  getIt.registerLazySingleton<TypeDamageStore>(
    () => TypeDamageStore(
      getIt.get<TypeDamageUseCase>(),
    ),
  );

  final store = getIt.get<TypeDamageStore>();
  test('should return one typeDamage', () async {
    when(() => getIt.get<TypeDamageRepository>().getTypeDamage(urlTest))
        .thenAnswer((_) async {
      store.typeDamage = TypeDamage();
      store.statusRequestTypedamage = StatusRequest.success;
    });

    store.getTypeDamage(urlTest);
    expect(store.typeDamage, isNotNull);
    expect(store.statusRequestTypedamage, StatusRequest.success);
  });

  test('typeDamage must be null', () {
    when(() => getIt.get<TypeDamageRepository>().getTypeDamage(urlTest))
        .thenAnswer((_) async {
      store.typeDamage = null;
      store.statusRequestTypedamage = StatusRequest.error;
    });

    store.getTypeDamage(urlTest);
    expect(store.typeDamage, isNull);
    expect(store.statusRequestTypedamage, StatusRequest.error);
  });
}

var urlTest = '';
