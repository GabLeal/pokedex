import 'package:pokedex/layers/data/dto/ability_details_entity.dart';

abstract class AbilityDetailsRepository {
  Future<AbilityDetailsDto?> getAbilityDetails(String url);
}
