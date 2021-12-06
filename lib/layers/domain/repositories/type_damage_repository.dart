import 'package:dio/dio.dart';
import 'package:pokedex/layers/domain/entities/type_damage_entity.dart';

class TypeDamageRepository {
  final Dio dio;
  TypeDamageRepository({
    required this.dio,
  });

  Future<TypeDamage?> getTypeDamage(String url) async {
    try {
      var response = await dio.get(url);

      var typeDamageResponse = response.data;

      TypeDamage typeDamage = TypeDamage.fromJson(typeDamageResponse);

      return typeDamage;
    } catch (erro) {
      return null;
    }
  }
}
