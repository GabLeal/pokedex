import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/model/move_details.dart';
import 'package:pokedex/repository/move_repository.dart';
import 'package:pokedex/util/enums.dart';

part 'move_store.g.dart';

class MoveStore = _MoveStoreBase with _$MoveStore;

abstract class _MoveStoreBase with Store {
  MoveDetails? moveDetails;

  MoveDetailsRepository _moveDetailsRepository =
      MoveDetailsRepository(dio: Dio());

  @observable
  StatusRequest statusRequestMove = StatusRequest.empty;

  void getMovie(String url) async {
    statusRequestMove = StatusRequest.loading;

    try {
      moveDetails = await _moveDetailsRepository.getMoveDetails(url);

      statusRequestMove = StatusRequest.success;
    } catch (erro) {
      statusRequestMove = StatusRequest.error;
      print(erro);
    }
  }
}
