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
  List<Moves>? moves;
  String? name;
  int? order;
  SpritesEntity? sprites;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;

  PokemonEntity(
      {this.abilities,
      this.height,
      this.id,
      this.locationAreaEncounters,
      this.moves,
      this.name,
      this.order,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  PokemonEntity.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = [];
      json['abilities'].forEach((v) {
        abilities!.add(new AbilitiesEntity.fromJson(v));
      });
    }

    height = json['height'];
    id = json['id'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = [];
      json['moves'].forEach((v) {
        moves!.add(new Moves.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    sprites = json['sprites'] != null
        ? new SpritesEntity.fromJson(json['sprites'])
        : null;
    if (json['stats'] != null) {
      stats = [];
      json['stats'].forEach((v) {
        stats!.add(new Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }

    data['height'] = this.height;

    data['id'] = this.id;
    data['location_area_encounters'] = this.locationAreaEncounters;
    if (this.moves != null) {
      data['moves'] = this.moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['order'] = this.order;

    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = this.weight;
    return data;
  }
}
