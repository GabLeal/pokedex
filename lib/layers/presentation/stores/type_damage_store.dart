import 'package:mobx/mobx.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';

import 'package:pokedex/layers/domain/usecases/type_damage/type_damage_use_case.dart';

part 'type_damage_store.g.dart';

class TypeDamageStore = _TypeDamageStoreBase with _$TypeDamageStore;

abstract class _TypeDamageStoreBase with Store {
  TypeDamage? typeDamage;

  final TypeDamageUseCase _typeDamageUseCase;

  _TypeDamageStoreBase(this._typeDamageUseCase);

  @observable
  StatusRequest statusRequestTypedamage = StatusRequest.empty;

  Future<void> getTypeDamage(String? url) async {
    statusRequestTypedamage = StatusRequest.loading;

    var result = await _typeDamageUseCase.getTypeDamage(url!);

    result.fold((error) {
      statusRequestTypedamage = StatusRequest.error;
      typeDamage = null;
    }, (success) {
      typeDamage = success;
      statusRequestTypedamage = StatusRequest.success;
    });
  }
}
