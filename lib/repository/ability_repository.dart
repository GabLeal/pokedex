import 'package:dio/dio.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

class AbilityDetailsRepository {
  final Dio dio;
  AbilityDetailsRepository({
    required this.dio,
  });

  Future<AbilityDetailsEntity?> getAbilityDetails(String url) async {
    try {
      var response = await dio.get(url);

      var abilityDetailsResponse = response.data;

      AbilityDetailsEntity abilityDetails =
          AbilityDetailsEntity.fromJson(abilityDetailsResponse);

      return abilityDetails;
    } catch (erro) {
      return null;
    }
  }
}
