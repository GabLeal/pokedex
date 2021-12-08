import 'package:pokedex/layers/data/dto/type_damage_entity.dart';

abstract class TypeDamageRepository {
  Future<TypeDamage?> getTypeDamage(String url);
}
