import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/dto/move_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';
import 'package:pokedex/util/enums.dart';

part 'move_store.g.dart';

class MoveStore = _MoveStoreBase with _$MoveStore;

abstract class _MoveStoreBase with Store {
  MoveDetailsDto? moveDetails;

  MoveDetailsRepository _moveDetailsRepository;

  _MoveStoreBase([MoveDetailsRepository? repository])
      : _moveDetailsRepository =
            repository ?? MoveDetailsRepository(dio: Dio());

  @observable
  StatusRequest statusRequestMove = StatusRequest.empty;

  void getMovie(String url) async {
    statusRequestMove = StatusRequest.loading;

    moveDetails = await _moveDetailsRepository.getMoveDetails(url);

    if (moveDetails != null) {
      statusRequestMove = StatusRequest.success;
    } else {
      statusRequestMove = StatusRequest.error;
    }
  }
}
