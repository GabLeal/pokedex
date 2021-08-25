import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/model/ability_details.dart';
import 'package:pokedex/repository/ability_repository.dart';
import 'package:pokedex/stores/ability_store.dart';
import 'package:pokedex/util/enums.dart';

class AbilityDetailsRepositoryMock extends Mock
    implements AbilityDetailsRepository {}

main() {
  final repository = AbilityDetailsRepositoryMock();

  final store = AbilityStore(repository);
  test('deve receber um MoveDetails', () async {
    when(() => repository.getAbilityDetails(urlTest)).thenAnswer((_) async {
      store.abilityDetails = AbilityDetails();
      store.statusRequestAbility = StatusRequest.success;
    });

    store.getAbilityDetails(urlTest);
    expect(store.abilityDetails, isNotNull);
    expect(store.statusRequestAbility, StatusRequest.success);
  });

  test('MoveDetails deve ser null', () {
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
