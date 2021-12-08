import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/dto/ability_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';

class AbilityDetailsRepositoryImp implements AbilityDetailsRepository {
  final Dio dio;

  AbilityDetailsRepositoryImp({
    required this.dio,
  });

  @override
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
