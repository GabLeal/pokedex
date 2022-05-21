import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/core/network/http_client_interface.dart';
import 'package:pokedex/layers/data/datasources/remote/ability/ability_datasource.dart';
import 'package:pokedex/layers/data/dto/ability_details_dto.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

class AbilityDetailsDatasourceImp implements AbilityDetailsDatasource {
  final IHttpClient _httpClient;

  AbilityDetailsDatasourceImp(this._httpClient);

  @override
  Future<Either<Failure, AbilityDetailsEntity>> getAbilityDetails(
      String url) async {
    try {
      var response = await _httpClient.get(url);

      if (response.statusCode != HttpStatus.ok) return Left(NotFoundFailure());
      var abilityDetailsResponse = response.body;

      AbilityDetailsDto abilityDetails =
          AbilityDetailsDto.fromJson(abilityDetailsResponse);

      return Right(abilityDetails);
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }
}
