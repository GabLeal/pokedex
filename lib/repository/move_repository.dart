import 'package:dio/dio.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

class MoveDetailsRepository {
  final Dio dio;
  MoveDetailsRepository({
    required this.dio,
  });

  Future<MoveDetails?> getMoveDetails(String url) async {
    try {
      var response = await dio.get(url);

      var moveDetailsResponse = response.data;

      MoveDetails moveDetails = MoveDetails.fromJson(moveDetailsResponse);

      return moveDetails;
    } catch (erro) {
      return null;
    }
  }
}
