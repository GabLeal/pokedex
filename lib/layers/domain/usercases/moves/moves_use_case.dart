import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

abstract class MovesUseCase {
  Future<MoveDetailsEntity?> getMoveDetails(String url);
}
