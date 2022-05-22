import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/data/datasources/remote/moves/move_datasource.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';

class MoveDetailsRepositoryImp implements MoveDetailsRepository {
  final MoveDatasource _moveDetailsDatasource;
  MoveDetailsRepositoryImp(this._moveDetailsDatasource);

  @override
  Future<Either<Failure, MoveDetailsEntity>> getMoveDetails(String url) async {
    var result = await _moveDetailsDatasource.getMoveDetails(url);

    return result;
  }
}
