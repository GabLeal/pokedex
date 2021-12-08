import 'package:pokedex/layers/data/dto/ability_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';
import 'package:pokedex/layers/domain/usercases/ability/ability_details_use_case.dart';

class AbilityDetailsUseCaseImp implements AbilityDetailsUseCase {
  late AbilityDetailsRepository _abilityDetailsRepository;

  AbilityDetailsUseCaseImp(this._abilityDetailsRepository);

  @override
  Future<AbilityDetailsDto?> getPokemonAbilityDetails(String url) async {
    return await _abilityDetailsRepository.getAbilityDetails(url);
  }
}
