import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

abstract class AbilityDetailsRepository {
  Future<AbilityDetailsEntity?> getAbilityDetails(String url);
}
