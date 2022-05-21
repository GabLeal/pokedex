import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/core/network/http_client_interface.dart';
import 'package:pokedex/layers/data/datasources/remote/moves/move_datasource.dart';
import 'package:pokedex/layers/data/dto/move_details_dto.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

class MoveDetailsDatasourceImp implements MoveDatasource {
  final IHttpClient _httpClient;
  MoveDetailsDatasourceImp(this._httpClient);

  @override
  Future<Either<Failure, MoveDetailsEntity>> getMoveDetails(String url) async {
    try {
      var response = await _httpClient.get(url);

      if (response.statusCode != HttpStatus.ok) return Left(NotFoundFailure());

      var moveDetailsResponse = response.body;

      MoveDetailsDto moveDetails = MoveDetailsDto.fromJson(moveDetailsResponse);

      return Right(moveDetails);
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }
}
