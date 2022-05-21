import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/core/network/http_client_interface.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';
import 'package:pokedex/layers/data/datasources/remote/type_damage/type_damage_datasource.dart';

class TypeDamageDatasourceImp implements TypeDamageDatasource {
  final IHttpClient _httpClient;
  TypeDamageDatasourceImp(this._httpClient);

  @override
  Future<Either<Failure, TypeDamage>> getTypeDamage(String url) async {
    try {
      var response = await _httpClient.get(url);

      if (response.statusCode != 200) return Left(NotFoundFailure());
      var typeDamageResponse = response.body;

      TypeDamage typeDamage = TypeDamage.fromJson(typeDamageResponse);

      return Right(typeDamage);
    } catch (erro) {
      return Left(DatasourceFailure());
    }
  }
}
