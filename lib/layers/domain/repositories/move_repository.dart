import 'package:pokedex/layers/data/dto/move_details_entity.dart';

abstract class MoveDetailsRepository {
  Future<MoveDetailsDto?> getMoveDetails(String url);
}
