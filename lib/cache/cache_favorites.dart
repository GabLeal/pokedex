import 'dart:convert';
import 'package:pokedex/layers/data/dto/abilities_dto.dart';
import 'package:pokedex/layers/data/dto/ability_dto.dart';
import 'package:pokedex/layers/data/dto/moves_dto.dart';
import 'package:pokedex/layers/data/dto/pokemon_dto.dart';
import 'package:pokedex/layers/data/dto/sprites_dto.dart';
import 'package:pokedex/layers/data/dto/stats_dto.dart';
import 'package:pokedex/layers/data/dto/type_dto.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheFavorites {
  Future<List<PokemonEntity>> getFavoritesPokemons() async {
    List<PokemonEntity>? favoritesPokemons = [];

    final instance = await SharedPreferences.getInstance();
    instance.getKeys().forEach((keyNamePokemon) {
      if (keyNamePokemon == 'myTeam') return;
      final json = jsonDecode(instance.getString(keyNamePokemon)!);
      PokemonEntity pokemon = PokemonDto.fromJson(json);
      favoritesPokemons.add(pokemon);
    });

    return favoritesPokemons;
  }

  Future<bool> favoritePokemon(PokemonEntity pokemon) async {
    final instance = await SharedPreferences.getInstance();

    List<AbilitiesDto> abilitiesDtoItens = [];
    List<MovesDto> movesDtoItens = [];
    List<StatsDto> statsDtoItens = [];
    List<TypesDto> typesDtoItens = [];

    //ABILITIES
    pokemon.abilities!.forEach((ability) {
      AbilitiesDto abilitiesDto = AbilitiesDto(
          abilityDto: AbilityDto(
        name: ability.ability!.name,
        url: ability.ability!.url,
      ));

      abilitiesDtoItens.add(abilitiesDto);
    });

    //MOVEs
    pokemon.moves!.forEach((move) {
      AbilitiesDto abilitiesDto = AbilitiesDto(
          abilityDto: AbilityDto(
        name: move.move!.name,
        url: move.move!.url,
      ));

      abilitiesDtoItens.add(abilitiesDto);
    });

    // STATS
    pokemon.stats!.forEach((stat) {
      StatsDto statsDto = StatsDto(
          baseStat: stat.baseStat,
          effort: stat.effort,
          stats: AbilityDto(
            name: stat.stat!.name,
            url: stat.stat!.url,
          ));

      statsDtoItens.add(statsDto);
    });

    // TYPES
    pokemon.types!.forEach((typeItem) {
      TypesDto typeDto = TypesDto(
          slot: typeItem.slot,
          typeDto: AbilityDto(
            name: typeItem.type!.name,
            url: typeItem.type!.url,
          ));

      typesDtoItens.add(typeDto);
    });

    PokemonDto pokemonDto = PokemonDto(
      name: pokemon.name,
      height: pokemon.height,
      id: pokemon.id,
      weight: pokemon.weight,
      order: pokemon.order,
      locationAreaEncounters: pokemon.locationAreaEncounters,
      spritesDto: SpritesDto(
        backDefault: pokemon.sprites!.backDefault,
        frontDefault: pokemon.sprites!.frontDefault,
      ),
      abilitiesDto: abilitiesDtoItens,
      movesDto: movesDtoItens,
      statsDto: statsDtoItens,
      typesDto: typesDtoItens,
    );

    return instance.setString(
        '${pokemon.name}', jsonEncode(pokemonDto.toJson()));
  }

  Future<bool> removeFavoritePokemon(PokemonEntity pokemon) async {
    final instance = await SharedPreferences.getInstance();
    return await instance.remove(pokemon.name!);
  }
}
