import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/domain/repositories/type_damage_repository.dart';
import 'package:pokedex/layers/domain/usercases/type_damage/type_damage_use_case.dart';

class TypeDamageUseCaseImp implements TypeDamageUseCase {
  late TypeDamageRepository _typeDamageRepository;

  @override
  Future<TypeDamage?> getTypeDamage(String url) async {
    var t = await _typeDamageRepository.getTypeDamage(url);
    return t;
  }
}
