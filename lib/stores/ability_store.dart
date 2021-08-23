import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/model/ability_details.dart';
import 'package:pokedex/util/enums.dart';

part 'ability_store.g.dart';

class AbilityStore = _AbilityStoreBase with _$AbilityStore;

abstract class _AbilityStoreBase with Store {
  AbilityDetails? abilityDetails;

  @observable
  StatusRequest statusRequestAbility = StatusRequest.empty;

  void getAbilityDetails(String url) async {
    statusRequestAbility = StatusRequest.loading;
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get(url);

      var abilityResponse = response.data;

      abilityDetails = AbilityDetails.fromJson(abilityResponse);

      statusRequestAbility = StatusRequest.success;
    } catch (erro) {
      statusRequestAbility = StatusRequest.error;
      print(erro);
    }
  }
}
