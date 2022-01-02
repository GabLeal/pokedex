import 'package:pokedex/layers/data/dto/abilities_dto.dart';
import 'package:pokedex/layers/data/dto/moves_dto.dart';
import 'package:pokedex/layers/data/dto/sprites_dto.dart';
import 'package:pokedex/layers/data/dto/stats_dto.dart';
import 'package:pokedex/layers/data/dto/type_dto.dart';

import 'package:pokedex/layers/domain/entities/pokemon_entity.dart';

class PokemonDto extends PokemonEntity {
  List<AbilitiesDto>? abilitiesDto;
  int? height;
  int? id;
  String? locationAreaEncounters;
  List<MovesDto>? movesDto;
  String? name;
  int? order;
  SpritesDto? spritesDto;
  List<StatsDto>? statsDto;
  List<TypesDto>? typesDto;
  int? weight;

  PokemonDto(
      {this.abilitiesDto,
      this.height,
      this.id,
      this.locationAreaEncounters,
      this.movesDto,
      this.name,
      this.order,
      this.spritesDto,
      this.statsDto,
      this.typesDto,
      this.weight})
      : super(
            abilities: abilitiesDto,
            height: height,
            id: id,
            locationAreaEncounters: locationAreaEncounters,
            moves: movesDto,
            name: name,
            order: order,
            sprites: spritesDto,
            stats: statsDto,
            types: typesDto,
            weight: weight);

  PokemonDto.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = [];
      json['abilities'].forEach((v) {
        abilities!.add(AbilitiesDto.fromJson(v));
      });
    }

    height = json['height'];
    id = json['id'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = [];
      json['moves'].forEach((v) {
        moves!.add(new MovesDto.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    sprites =
        json['sprites'] != null ? SpritesDto.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = [];
      json['stats'].forEach((v) {
        stats!.add(StatsDto.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types!.add(TypesDto.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilitiesDto!.map((v) => v.toJson()).toList();
    }

    data['height'] = this.height;

    data['id'] = this.id;
    data['location_area_encounters'] = this.locationAreaEncounters;
    if (this.movesDto != null) {
      data['moves'] = this.movesDto!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['order'] = this.order;

    if (this.spritesDto != null) {
      data['sprites'] = this.spritesDto!.toJson();
    }
    if (this.statsDto != null) {
      data['stats'] = this.statsDto!.map((v) => v.toJson()).toList();
    }
    if (this.typesDto != null) {
      data['types'] = this.typesDto!.map((v) => v.toJson()).toList();
    }
    data['weight'] = this.weight;
    return data;
  }
}
