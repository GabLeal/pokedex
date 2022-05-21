import 'package:pokedex/layers/domain/entities/abilities_entity.dart';
import 'package:pokedex/layers/domain/entities/ability_entity.dart';
import 'package:pokedex/layers/domain/entities/moves_entity.dart';
import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';
import 'package:pokedex/layers/domain/entities/sprites_entity.dart';
import 'package:pokedex/layers/domain/entities/stats_entity.dart';
import 'package:pokedex/layers/domain/entities/type_entity.dart';

var pokemonEntityMock = PokemonEntity(
    abilities: [
      AbilitiesEntity(
        ability: AbilityEntity(name: 'name', url: 'url'),
      ),
    ],
    height: 10,
    weight: 20,
    name: 'name',
    order: 1,
    sprites: SpritesEntity(
      backDefault: '',
      frontDefault: '',
    ),
    id: 1,
    locationAreaEncounters: '',
    stats: [
      StatsEntity(
        effort: 1,
        baseStat: 1,
        stat: AbilityEntity(
          name: '',
          url: '',
        ),
      ),
    ],
    moves: [
      MovesEntity(
        move: AbilityEntity(
          name: '',
          url: '',
        ),
      )
    ],
    types: [
      TypesEntity(
        slot: 1,
        type: AbilityEntity(
          name: '',
          url: '',
        ),
      )
    ]);
