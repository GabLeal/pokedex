import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

abstract class MovesUseCase {
  Future<Either<Failure, MoveDetailsEntity>> getMoveDetails(String url);
}
