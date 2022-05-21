import 'package:mobx/mobx.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';
import 'package:pokedex/layers/domain/usercases/ability/ability_details_use_case.dart';

part 'ability_store.g.dart';

class AbilityStore = _AbilityStoreBase with _$AbilityStore;

abstract class _AbilityStoreBase with Store {
  AbilityDetailsEntity? abilityDetails;
  AbilityDetailsUseCase _abilityDetailsUseCase;

  _AbilityStoreBase(this._abilityDetailsUseCase);
  @observable
  StatusRequest statusRequestAbility = StatusRequest.empty;

  Future<void> getAbilityDetails(String url) async {
    statusRequestAbility = StatusRequest.loading;

    var result = await _abilityDetailsUseCase.getPokemonAbilityDetails(url);

    result.fold((error) {
      statusRequestAbility = StatusRequest.error;
      abilityDetails = null;
    }, (success) {
      abilityDetails = success;
      statusRequestAbility = StatusRequest.success;
    });
  }
}
