import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

abstract class AbilityDetailsUseCase {
  Future<Either<Failure, AbilityDetailsEntity>> getPokemonAbilityDetails(
      String url);
}
