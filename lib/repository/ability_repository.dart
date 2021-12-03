import 'package:dio/dio.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

class AbilityDetailsRepository {
  final Dio dio;
  AbilityDetailsRepository({
    required this.dio,
  });

  Future<AbilityDetails?> getAbilityDetails(String url) async {
    try {
      var response = await dio.get(url);

      var abilityDetailsResponse = response.data;

      AbilityDetails abilityDetails =
          AbilityDetails.fromJson(abilityDetailsResponse);

      return abilityDetails;
    } catch (erro) {
      return null;
    }
  }
}
