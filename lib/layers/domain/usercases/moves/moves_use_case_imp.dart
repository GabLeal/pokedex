import 'package:pokedex/layers/data/dto/move_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case.dart';

class MovesUseCaseImp implements MovesUseCase {
  late MoveDetailsRepository _moveDetailsRepository;
  @override
  Future<MoveDetailsDto?> getMoveDetails(String url) async {
    return await _moveDetailsRepository.getMoveDetails(url);
  }
}
