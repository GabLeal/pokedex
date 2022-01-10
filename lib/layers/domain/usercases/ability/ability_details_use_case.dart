import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

abstract class AbilityDetailsUseCase {
  Future<AbilityDetailsEntity?> getPokemonAbilityDetails(String url);
}
