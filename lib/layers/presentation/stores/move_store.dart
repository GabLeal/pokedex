import 'package:mobx/mobx.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';
import 'package:pokedex/layers/domain/usercases/moves/moves_use_case.dart';

part 'move_store.g.dart';

class MoveStore = _MoveStoreBase with _$MoveStore;

abstract class _MoveStoreBase with Store {
  MoveDetailsEntity? moveDetails;

  final MovesUseCase _movesUseCase;

  _MoveStoreBase(this._movesUseCase);

  @observable
  StatusRequest statusRequestMove = StatusRequest.empty;

  void getMovie(String url) async {
    statusRequestMove = StatusRequest.loading;

    moveDetails = await _movesUseCase.getMoveDetails(url);

    if (moveDetails != null) {
      statusRequestMove = StatusRequest.success;
    } else {
      statusRequestMove = StatusRequest.error;
    }
  }
}
