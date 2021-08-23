import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/model/type_damage.dart';
import 'package:pokedex/util/enums.dart';

part 'type_damage_store.g.dart';

class TypeDamageStore = _TypeDamageStoreBase with _$TypeDamageStore;

abstract class _TypeDamageStoreBase with Store {
  TypeDamage? typeDamage;

  @observable
  StatusRequest statusRequestTypedamage = StatusRequest.empty;

  void getTypeDamage(String? url) async {
    statusRequestTypedamage = StatusRequest.loading;
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get(url!);

      var typeDamageResponse = response.data;

      typeDamage = TypeDamage.fromJson(typeDamageResponse);

      statusRequestTypedamage = StatusRequest.success;
    } catch (erro) {
      statusRequestTypedamage = StatusRequest.error;
      print(erro);
    }
  }
}
