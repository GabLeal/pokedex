import 'package:pokedex/layers/domain/entities/abilities_entity.dart';
import 'package:pokedex/layers/domain/entities/moves_entity.dart';
import 'package:pokedex/layers/domain/entities/sprites_entity.dart';
import 'package:pokedex/layers/domain/entities/stats_entity.dart';
import 'package:pokedex/layers/domain/entities/type_entity.dart';

class PokemonEntity {
  List<AbilitiesEntity>? abilities;
  int? height;
  int? id;
  String? locationAreaEncounters;
  List<MovesEntity>? moves;
  String? name;
  int? order;
  SpritesEntity? sprites;
  List<StatsEntity>? stats;
  List<TypesEntity>? types;
  int? weight;

  PokemonEntity({
    this.abilities,
    this.height,
    this.id,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonEntity && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
