import 'package:pokedex/layers/domain/entities/damage_entity.dart';
import 'package:pokedex/layers/domain/entities/effect_entries_entity.dart';

class MoveDetailsEntity {
  int? accuracy;
  DamageEntity? damageClass;
  int? effectChance;
  List<EffectEntriesEntity>? effectEntries;
  String? name;
  int? power;
  int? pp;
  int? priority;
  DamageEntity? type;

  MoveDetailsEntity({
    this.accuracy,
    this.damageClass,
    this.effectChance,
    this.effectEntries,
    this.name,
    this.power,
    this.pp,
    this.priority,
    this.type,
  });
}
