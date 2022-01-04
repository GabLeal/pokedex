import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/data/dto/ability_details_dto.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/layers/domain/usercases/ability/ability_details_use_case.dart';
import 'package:pokedex/layers/domain/usercases/ability/ability_details_use_case_imp.dart';
import 'package:pokedex/layers/presentation/stores/ability_store.dart';

class AbilityDetailsRepositoryMock extends Mock
    implements AbilityDetailsRepository {}

main() {
  GetIt getIt = GetIt.instance;

  getIt.registerLazySingleton<AbilityDetailsRepository>(
    () => AbilityDetailsRepositoryMock(),
  );

  getIt.registerLazySingleton<AbilityDetailsUseCase>(
    () => AbilityDetailsUseCaseImp(
      getIt.get<AbilityDetailsRepository>(),
    ),
  );

  getIt.registerLazySingleton<AbilityStore>(
    () => AbilityStore(
      getIt.get<AbilityDetailsUseCase>(),
    ),
  );

  final store = getIt.get<AbilityStore>();

  test('should return one Ability', () async {
    when(() => getIt
        .get<AbilityDetailsUseCase>()
        .getPokemonAbilityDetails(urlTest)).thenAnswer((_) async {
      store.abilityDetails = AbilityDetailsDto();
      store.statusRequestAbility = StatusRequest.success;
    });

    store.getAbilityDetails(urlTest);
    expect(store.abilityDetails, isNotNull);
    expect(store.statusRequestAbility, StatusRequest.success);
  });

  test('Ability must be null', () {
    when(() => getIt
        .get<AbilityDetailsUseCase>()
        .getPokemonAbilityDetails(urlTest)).thenAnswer((_) async {
      store.abilityDetails = null;
      store.statusRequestAbility = StatusRequest.error;
    });

    store.getAbilityDetails(urlTest);
    expect(store.abilityDetails, isNull);
    expect(store.statusRequestAbility, StatusRequest.error);
  });
}

var urlTest = '';
