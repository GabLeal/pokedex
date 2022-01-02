import 'package:pokedex/layers/domain/entities/move_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case.dart';

class MovesUseCaseImp implements MovesUseCase {
  final MoveDetailsRepository _moveDetailsRepository;

  MovesUseCaseImp(this._moveDetailsRepository);
  @override
  Future<MoveDetailsEntity?> getMoveDetails(String url) async {
    return await _moveDetailsRepository.getMoveDetails(url);
  }
}
