import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';

abstract class TypeDamageRepository {
  Future<Either<Failure, TypeDamage>> getTypeDamage(String url);
}
