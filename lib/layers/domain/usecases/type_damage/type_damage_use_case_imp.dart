import 'package:either_dart/either.dart';
import 'package:pokedex/core/failure/failure.dart';
import 'package:pokedex/layers/data/dto/type_damage_dto.dart';

import 'package:pokedex/layers/domain/repositories/type_damage_repository.dart';
import 'package:pokedex/layers/domain/usecases/type_damage/type_damage_use_case.dart';

class TypeDamageUseCaseImp implements TypeDamageUseCase {
  final TypeDamageRepository _typeDamageRepository;

  TypeDamageUseCaseImp(this._typeDamageRepository);

  @override
  Future<Either<Failure, TypeDamage>> getTypeDamage(String url) async {
    var result = await _typeDamageRepository.getTypeDamage(url);
    return result;
  }
}
