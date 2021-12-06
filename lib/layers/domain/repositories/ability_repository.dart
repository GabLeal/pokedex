import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/dto/ability_details_entity.dart';

class AbilityDetailsRepository {
  final Dio dio;
  AbilityDetailsRepository({
    required this.dio,
  });

  Future<AbilityDetailsDto?> getAbilityDetails(String url) async {
    try {
      var response = await dio.get(url);

      var abilityDetailsResponse = response.data;

      AbilityDetailsDto abilityDetails =
          AbilityDetailsDto.fromJson(abilityDetailsResponse);

      return abilityDetails;
    } catch (erro) {
      return null;
    }
  }
}
