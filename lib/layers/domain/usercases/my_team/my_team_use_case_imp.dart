import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/repositories/my_team_repository.dart';
import 'package:pokedex/layers/domain/usercases/my_team/my_team_use_case.dart';

class MyTeamUseCaseImp implements MyTeamUseCase {
  final MyTeamRepository _myTeamRepository;

  MyTeamUseCaseImp(this._myTeamRepository);
  @override
  Future<bool> add(PokemonEntity pokemon) async {
    return await _myTeamRepository.add(pokemon);
  }

  @override
  Future<List<PokemonEntity>> fetch() async {
    return await _myTeamRepository.fetch();
  }

  @override
  Future<bool> remove(int idPokemon) async {
    return await _myTeamRepository.remove(idPokemon);
  }
}
