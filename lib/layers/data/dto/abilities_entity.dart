import 'package:pokedex/layers/data/dto/ability_entity.dart';
import 'package:pokedex/layers/domain/entities/abilities_entity.dart';

class AbilitiesDto extends AbilitiesEntity {
  AbilityDto? abilityDto;

  AbilitiesDto({this.abilityDto}) : super(ability: abilityDto);

  AbilitiesDto.fromJson(Map<String, dynamic> json) {
    abilityDto =
        json['ability'] != null ? AbilityDto.fromJson(json['ability']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.abilityDto!.toJson();
    }
    return data;
  }
}
