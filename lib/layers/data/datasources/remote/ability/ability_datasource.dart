import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

abstract class AbilityDetailsDatasource {
  Future<Either<Failure, AbilityDetailsEntity>> getAbilityDetails(String url);
}
