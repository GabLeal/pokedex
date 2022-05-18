import 'dart:convert';
import 'dart:developer';
import 'package:pokedex/layers/data/datasources/local/my_team/my_team_datasorce.dart';
import 'package:pokedex/layers/data/dto/ability_dto.dart';
import 'package:pokedex/layers/data/dto/pokemon_dto.dart';
import 'package:pokedex/layers/data/dto/sprites_dto.dart';
import 'package:pokedex/layers/data/dto/type_dto.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTeamDatasourceImp implements MyTeamDatasource {
  @override
  Future<bool> add(PokemonEntity pokemon) async {
    final instance = await SharedPreferences.getInstance();
    List<PokemonEntity> myTeam = await fetch();
    myTeam.add(pokemon);

    List<PokemonDto> dtos = myTeam.map((pokemon) {
      return PokemonDto(
        name: pokemon.name,
        id: pokemon.id,
        order: pokemon.order,
        spritesDto: SpritesDto(
          backDefault: pokemon.sprites!.backDefault,
          frontDefault: pokemon.sprites!.frontDefault,
        ),
        typesDto: [
          TypesDto(
            slot: pokemon.types?.first.slot,
            typeDto: AbilityDto(
              name: pokemon.types?.first.type?.name,
              url: pokemon.types?.first.type?.url,
            ),
          )
        ],
      );
    }).toList();

    var jsonList = dtos
        .map(
          (myPokemonTeam) => myPokemonTeam.toJson(),
        )
        .toList();
    var jsonMyPokemons = jsonEncode(jsonList);
    return instance.setString('myTeam', jsonMyPokemons);
  }

  @override
  Future<List<PokemonEntity>> fetch() async {
    List<PokemonEntity> myTeam = [];

    final instance = await SharedPreferences.getInstance();
    var myTeamCache = instance.getString('myTeam');
    if (myTeamCache == null) return myTeam;
    var myTeamJson = jsonDecode(myTeamCache);
    log(myTeamCache.toString());
    myTeam = List.of(myTeamJson).map((pokemon) {
      return PokemonDto.fromJson(pokemon);
    }).toList();

    return myTeam;
  }

  @override
  Future<bool> remove(int idPokemon) async {
    final instance = await SharedPreferences.getInstance();
    List<PokemonEntity> myTeam = await fetch();

    myTeam.removeWhere((pokemon) => pokemon.id == idPokemon);
    List<PokemonDto> dtos = myTeam.map((pokemon) {
      return PokemonDto(
        name: pokemon.name,
        id: pokemon.id,
        order: pokemon.order,
        spritesDto: SpritesDto(
          backDefault: pokemon.sprites!.backDefault,
          frontDefault: pokemon.sprites!.frontDefault,
        ),
        typesDto: [
          TypesDto(
            slot: pokemon.types?.first.slot,
            typeDto: AbilityDto(
              name: pokemon.types?.first.type?.name,
              url: pokemon.types?.first.type?.url,
            ),
          )
        ],
      );
    }).toList();

    var jsonList = dtos.map((pokemon) => pokemon.toJson()).toList();
    var jsonMyTeam = jsonEncode(jsonList);

    return instance.setString('myTeam', jsonMyTeam);
  }
}
