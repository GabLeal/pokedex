import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/repositories/type_damage_repository_imp.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/domain/repositories/type_damage_repository.dart';
import 'package:pokedex/util/enums.dart';

part 'type_damage_store.g.dart';

class TypeDamageStore = _TypeDamageStoreBase with _$TypeDamageStore;

abstract class _TypeDamageStoreBase with Store {
  TypeDamage? typeDamage;
  TypeDamageRepository _typeDamageRepository;

  _TypeDamageStoreBase([TypeDamageRepository? repository])
      : _typeDamageRepository =
            repository ?? TypeDamageRepositoryImp(dio: Dio());

  @observable
  StatusRequest statusRequestTypedamage = StatusRequest.empty;

  void getTypeDamage(String? url) async {
    statusRequestTypedamage = StatusRequest.loading;
    try {
      typeDamage = await _typeDamageRepository.getTypeDamage(url!);

      if (typeDamage != null) {
        statusRequestTypedamage = StatusRequest.success;
      } else {
        statusRequestTypedamage = StatusRequest.error;
      }
    } catch (erro) {
      statusRequestTypedamage = StatusRequest.error;
      print(erro);
    }
  }
}
