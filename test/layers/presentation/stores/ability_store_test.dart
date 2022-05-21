import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';
import 'package:pokedex/layers/domain/usercases/ability/ability_details_use_case.dart';
import 'package:pokedex/layers/presentation/stores/ability_store.dart';

class AbilityDetailsUseCaseMock extends Mock implements AbilityDetailsUseCase {}

main() {
  final useCase = AbilityDetailsUseCaseMock();
  final store = AbilityStore(useCase);

  test('should return one Ability', () async {
    when(() => useCase.getPokemonAbilityDetails(any())).thenAnswer((_) async {
      return Right(AbilityDetailsEntity());
    });

    await store.getAbilityDetails(urlTest);
    expect(store.abilityDetails, isNotNull);
    expect(store.statusRequestAbility, StatusRequest.success);
  });

  test('Ability must be null', () async {
    when(() => useCase.getPokemonAbilityDetails(any())).thenAnswer((_) async {
      return Left(Failure('any'));
    });

    await store.getAbilityDetails(urlTest);
    expect(store.abilityDetails, isNull);
    expect(store.statusRequestAbility, StatusRequest.error);
  });
}

var urlTest = '';
