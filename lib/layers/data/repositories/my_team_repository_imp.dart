import 'dart:developer';

import 'package:pokedex/layers/data/datasources/local/my_team/my_team_datasorce.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/my_team_repository.dart';

class MyTeamRepositoryImp implements MyTeamRepository {
  final MyTeamDatasource _myTeamDatasource;
  MyTeamRepositoryImp(this._myTeamDatasource);

  @override
  Future<bool> add(PokemonEntity pokemon) {
    return _myTeamDatasource.add(pokemon);
  }

  @override
  Future<List<PokemonEntity>> fetch() async {
    var result = await _myTeamDatasource.fetch();
    result.forEach((element) {
      log(element.toString());
    });
    return result;
  }

  @override
  Future<bool> remove(int idPokemon) {
    return _myTeamDatasource.remove(idPokemon);
  }
}
