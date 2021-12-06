import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/dto/move_details_entity.dart';

class MoveDetailsRepository {
  final Dio dio;
  MoveDetailsRepository({
    required this.dio,
  });

  Future<MoveDetailsDto?> getMoveDetails(String url) async {
    try {
      var response = await dio.get(url);

      var moveDetailsResponse = response.data;

      MoveDetailsDto moveDetails = MoveDetailsDto.fromJson(moveDetailsResponse);

      return moveDetails;
    } catch (erro) {
      return null;
    }
  }
}
