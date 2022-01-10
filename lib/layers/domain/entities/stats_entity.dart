import 'package:pokedex/layers/domain/entities/ability_entity.dart';

class StatsEntity {
  int? baseStat;
  int? effort;
  AbilityEntity? stat;

  StatsEntity({this.baseStat, this.effort, this.stat});

  // StatsEntity.fromJson(Map<String, dynamic> json) {
  //   baseStat = json['base_stat'];
  //   effort = json['effort'];
  //   stat =
  //       json['stat'] != null ? new AbilityEntity.fromJson(json['stat']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['base_stat'] = this.baseStat;
  //   data['effort'] = this.effort;
  //   if (this.stat != null) {
  //     data['stat'] = this.stat!.toJson();
  //   }
  //   return data;
  // }
}
