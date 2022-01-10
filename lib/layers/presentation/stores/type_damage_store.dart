import 'package:mobx/mobx.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/domain/usercases/type_damage/type_damage_use_case.dart';

part 'type_damage_store.g.dart';

class TypeDamageStore = _TypeDamageStoreBase with _$TypeDamageStore;

abstract class _TypeDamageStoreBase with Store {
  TypeDamage? typeDamage;

  final TypeDamageUseCase _typeDamageUseCase;

  _TypeDamageStoreBase(this._typeDamageUseCase);

  @observable
  StatusRequest statusRequestTypedamage = StatusRequest.empty;

  void getTypeDamage(String? url) async {
    statusRequestTypedamage = StatusRequest.loading;
    try {
      typeDamage = await _typeDamageUseCase.getTypeDamage(url!);

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
