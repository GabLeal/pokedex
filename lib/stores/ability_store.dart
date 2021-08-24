import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/model/ability_details.dart';
import 'package:pokedex/repository/ability_repository.dart';
import 'package:pokedex/util/enums.dart';

part 'ability_store.g.dart';

class AbilityStore = _AbilityStoreBase with _$AbilityStore;

abstract class _AbilityStoreBase with Store {
  AbilityDetails? abilityDetails;
  AbilityDetailsRepository _abilityDetailsRepository =
      AbilityDetailsRepository(dio: Dio());
  @observable
  StatusRequest statusRequestAbility = StatusRequest.empty;

  void getAbilityDetails(String url) async {
    statusRequestAbility = StatusRequest.loading;
    try {
      abilityDetails = await _abilityDetailsRepository.getAbilityDetails(url);

      statusRequestAbility = StatusRequest.success;
    } catch (erro) {
      statusRequestAbility = StatusRequest.error;
      print(erro);
    }
  }
}
