import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/layers/domain/usecases/ability/ability_details_use_case.dart';

class AbilityDetailsUseCaseImp implements AbilityDetailsUseCase {
  final AbilityDetailsRepository _abilityDetailsRepository;

  AbilityDetailsUseCaseImp(this._abilityDetailsRepository);

  @override
  Future<Either<Failure, AbilityDetailsEntity>> getPokemonAbilityDetails(
      String url) async {
    return await _abilityDetailsRepository.getAbilityDetails(url);
  }
}
