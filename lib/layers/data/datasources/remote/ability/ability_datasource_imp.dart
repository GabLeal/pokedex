import 'dart:io';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/data/datasources/remote/ability/ability_datasource.dart';
import 'package:pokedex/layers/data/dto/ability_details_dto.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

class AbilityDetailsDatasourceImp implements AbilityDetailsDatasource {
  final Dio _dio;

  AbilityDetailsDatasourceImp(this._dio);

  @override
  Future<Either<Failure, AbilityDetailsEntity>> getAbilityDetails(
      String url) async {
    try {
      var response = await _dio.get(url);

      if (response.statusCode != HttpStatus.ok) throw NotFoundFailure();

      var abilityDetailsResponse = response.data;

      AbilityDetailsDto abilityDetails =
          AbilityDetailsDto.fromJson(abilityDetailsResponse);

      return Right(abilityDetails);
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }
}
