import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/dto/ability_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/stores/ability_store.dart';
import 'package:pokedex/util/enums.dart';

class AbilityDetailsRepositoryMock extends Mock
    implements AbilityDetailsRepository {}

main() {
  final repository = AbilityDetailsRepositoryMock();

  final store = AbilityStore(repository);
  test('should return one Ability', () async {
    when(() => repository.getAbilityDetails(urlTest)).thenAnswer((_) async {
      store.abilityDetails = AbilityDetailsDto();
      store.statusRequestAbility = StatusRequest.success;
    });

    store.getAbilityDetails(urlTest);
    expect(store.abilityDetails, isNotNull);
    expect(store.statusRequestAbility, StatusRequest.success);
  });

  test('Ability must be null', () {
    when(() => repository.getAbilityDetails(urlTest)).thenAnswer((_) async {
      store.abilityDetails = null;
      store.statusRequestAbility = StatusRequest.error;
    });

    store.getAbilityDetails(urlTest);
    expect(store.abilityDetails, isNull);
    expect(store.statusRequestAbility, StatusRequest.error);
  });
}

var urlTest = '';
