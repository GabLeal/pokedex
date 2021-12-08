import 'package:pokedex/layers/data/dto/move_details_entity.dart';

abstract class MovesUseCase {
  Future<MoveDetailsDto?> getMoveDetails(String url);
}
