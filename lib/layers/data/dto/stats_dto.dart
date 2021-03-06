import 'package:pokedex/layers/data/dto/ability_dto.dart';
import 'package:pokedex/layers/domain/entities/stats_entity.dart';

class StatsDto extends StatsEntity {
  int? baseStat;
  int? effort;
  AbilityDto? stats;

  StatsDto({this.baseStat, this.effort, this.stats})
      : super(
          baseStat: baseStat,
          effort: effort,
          stat: stats,
        );

  StatsDto.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? AbilityDto.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stats != null) {
      data['stat'] = this.stats!.toJson();
    }
    return data;
  }
}
