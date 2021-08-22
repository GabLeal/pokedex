import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/model/model.dart';
import 'package:pokedex/model/move_details.dart';
import 'package:pokedex/util/base_url.dart';
import 'package:pokedex/util/enums.dart';

part 'move_store.g.dart';

class MoveStore = _MoveStoreBase with _$MoveStore;

abstract class _MoveStoreBase with Store {
  MoveDetails? moveDetails;

  @observable
  StatusRequest statusRequestMove = StatusRequest.empty;

  void getMovie(String url) async {
    statusRequestMove = StatusRequest.loading;
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get(url);

      var movieResponse = response.data;

      moveDetails = MoveDetails.fromJson(movieResponse);

      statusRequestMove = StatusRequest.success;
    } catch (erro) {
      statusRequestMove = StatusRequest.error;
      print(erro);
    }
  }
}
