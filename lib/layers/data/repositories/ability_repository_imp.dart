import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/data/datasources/remote/ability/ability_datasource.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';
import 'package:pokedex/layers/domain/repositories/ability_repository.dart';

class AbilityDetailsRepositoryImp implements AbilityDetailsRepository {
  final AbilityDetailsDatasource _abilityDetailsDatasource;

  AbilityDetailsRepositoryImp(this._abilityDetailsDatasource);

  @override
  Future<Either<Failure, AbilityDetailsEntity>> getAbilityDetails(
      String url) async {
    var result = await _abilityDetailsDatasource.getAbilityDetails(url);

    return result;
  }
}
