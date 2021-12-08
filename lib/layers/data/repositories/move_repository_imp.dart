import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/dto/move_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/move_repository.dart';

class MoveDetailsRepositoryImp implements MoveDetailsRepository {
  final Dio dio;
  MoveDetailsRepositoryImp({
    required this.dio,
  });

  @override
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
