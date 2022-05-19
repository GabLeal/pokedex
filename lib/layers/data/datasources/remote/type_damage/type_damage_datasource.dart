import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/type_damage_entity.dart';

abstract class TypeDamageDatasource{
   Future<Either<Failure, TypeDamage>> getTypeDamage(String url);
}