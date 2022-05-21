import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/data/datasources/remote/type_damage/type_damage_datasource.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';

import 'package:pokedex/layers/domain/repositories/type_damage_repository.dart';

class TypeDamageRepositoryImp implements TypeDamageRepository {
  final TypeDamageDatasource _typeDamageDatasource;
  TypeDamageRepositoryImp(this._typeDamageDatasource);

  @override
  Future<Either<Failure, TypeDamage>> getTypeDamage(String url) async {
    try {
      var result = await _typeDamageDatasource.getTypeDamage(url);

      return result;
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }
}
