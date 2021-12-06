import 'package:pokedex/layers/data/dto/damage_entity.dart';
import 'package:pokedex/layers/data/dto/effect_entries_entity.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

class MoveDetailsDto extends MoveDetailsEntity {
  int? accuracy;
  DamageDto? damageDto;
  int? effectChance;
  List<EffectEntriesDto>? effectEntriesDto;
  String? name;
  int? power;
  int? pp;
  int? priority;
  DamageDto? typeDto;

  MoveDetailsDto({
    this.accuracy,
    this.damageDto,
    this.effectChance,
    this.effectEntriesDto,
    this.name,
    this.power,
    this.pp,
    this.priority,
    this.typeDto,
  }) : super(
          accuracy: accuracy,
          damageClass: damageDto,
          name: name,
          effectEntries: effectEntriesDto,
          type: typeDto,
          effectChance: effectChance,
          power: power,
          pp: pp,
          priority: priority,
        );

  MoveDetailsDto.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];

    damageDto = json['damage_class'] != null
        ? new DamageDto.fromJson(json['damage_class'])
        : null;
    effectChance = json['effect_chance'];

    if (json['effect_entries'] != null) {
      effectEntriesDto = [];
      json['effect_entries'].forEach((v) {
        effectEntriesDto!.add(EffectEntriesDto.fromJson(v));
      });
    }
    name = json['name'];
    power = json['power'];
    pp = json['pp'];
    priority = json['priority'];
    typeDto =
        json['type'] != null ? new DamageDto.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accuracy'] = this.accuracy;

    if (this.damageDto != null) {
      data['damage_class'] = this.damageDto!.toJson();
    }
    data['effect_chance'] = this.effectChance;

    if (this.effectEntriesDto != null) {
      data['effect_entries'] =
          this.effectEntriesDto!.map((v) => v.toJson()).toList();
    }

    data['power'] = this.power;
    data['pp'] = this.pp;
    data['priority'] = this.priority;

    if (this.typeDto != null) {
      data['type'] = this.typeDto!.toJson();
    }
    return data;
  }
}
