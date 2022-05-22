import 'package:pokedex/layers/domain/entities/ability_entity.dart';

class StatsEntity {
  int? baseStat;
  int? effort;
  AbilityEntity? stat;

  StatsEntity({this.baseStat, this.effort, this.stat});
}
