import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/dto/ability_details_entity.dart';
import 'package:pokedex/layers/data/repositories/ability_repository_imp.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/util/enums.dart';

part 'ability_store.g.dart';

class AbilityStore = _AbilityStoreBase with _$AbilityStore;

abstract class _AbilityStoreBase with Store {
  AbilityDetailsDto? abilityDetails;
  AbilityDetailsRepository _abilityDetailsRepository;

  _AbilityStoreBase([AbilityDetailsRepository? repository])
      : _abilityDetailsRepository =
            repository ?? AbilityDetailsRepositoryImp(dio: Dio());
  @observable
  StatusRequest statusRequestAbility = StatusRequest.empty;

  void getAbilityDetails(String url) async {
    statusRequestAbility = StatusRequest.loading;

    abilityDetails = await _abilityDetailsRepository.getAbilityDetails(url);

    if (abilityDetails != null) {
      statusRequestAbility = StatusRequest.success;
    } else {
      statusRequestAbility = StatusRequest.error;
    }
  }
}
