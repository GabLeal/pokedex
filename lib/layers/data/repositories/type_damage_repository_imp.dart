import 'package:dio/dio.dart';
import 'package:pokedex/layers/data/dto/type_damage_entity.dart';
import 'package:pokedex/layers/domain/repositories/type_damage_repository.dart';

class TypeDamageRepositoryImp implements TypeDamageRepository {
  final Dio dio;
  TypeDamageRepositoryImp({
    required this.dio,
  });

  @override
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
