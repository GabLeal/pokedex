import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokedex/model/move_details.dart';

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
