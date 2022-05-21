import 'package:mobx/mobx.dart';
import 'package:pokedex/core/util/enums.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';
import 'package:pokedex/layers/domain/usecases/moves/moves_use_case.dart';

part 'move_store.g.dart';

class MoveStore = _MoveStoreBase with _$MoveStore;

abstract class _MoveStoreBase with Store {
  MoveDetailsEntity? moveDetails;

  final MovesUseCase _movesUseCase;

  _MoveStoreBase(this._movesUseCase);

  @observable
  StatusRequest statusRequestMove = StatusRequest.empty;

  Future<void> getMovie(String url) async {
    statusRequestMove = StatusRequest.loading;

    var result = await _movesUseCase.getMoveDetails(url);

    result.fold((error) {
      statusRequestMove = StatusRequest.error;
      moveDetails = null;
    }, (success) {
      moveDetails = success;
      statusRequestMove = StatusRequest.success;
    });
  }
}
