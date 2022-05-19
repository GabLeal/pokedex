

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/domain/entities/type_damage_entity.dart';
import 'package:pokedex/layers/data/datasources/remote/type_damage/type_damage_datasource.dart';

class TypeDamageDatasourceImp implements TypeDamageDatasource {
  final Dio _dio;
  TypeDamageDatasourceImp(this._dio);

  @override
   Future<Either<Failure, TypeDamage>> getTypeDamage(String url) async {
    try {
      var response = await _dio.get(url);

      var typeDamageResponse = response.data;

      TypeDamage typeDamage = TypeDamage.fromJson(typeDamageResponse);

      return Right(typeDamage);
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }
}