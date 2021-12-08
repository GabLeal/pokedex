import 'package:pokedex/layers/data/dto/ability_details_entity.dart';

abstract class AbilityDetailsUseCase {
  Future<AbilityDetailsDto?> getPokemonAbilityDetails(String url);
}
