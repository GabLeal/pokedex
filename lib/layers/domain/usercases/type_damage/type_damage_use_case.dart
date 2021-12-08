import 'package:pokedex/layers/data/dto/type_damage_entity.dart';

abstract class TypeDamageUseCase {
  Future<TypeDamage?> getTypeDamage(String url);
}
