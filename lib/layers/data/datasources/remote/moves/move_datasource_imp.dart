import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/layers/data/datasources/remote/moves/move_datasource.dart';
import 'package:pokedex/layers/data/dto/move_details_dto.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

class MoveDetailsDatasourceImp implements MoveDatasource {
  final Dio _dio;
  MoveDetailsDatasourceImp(this._dio);

  @override
  Future<Either<Failure,MoveDetailsEntity>> getMoveDetails(String url) async {
    try {
      var response = await _dio.get(url);

      if(response.statusCode != HttpStatus.ok) throw NotFoundFailure();

      var moveDetailsResponse = response.data;

      MoveDetailsDto moveDetails = MoveDetailsDto.fromJson(moveDetailsResponse);

      return Right(moveDetails);
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }
}
