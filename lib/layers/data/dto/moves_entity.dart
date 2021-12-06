import 'package:pokedex/layers/data/dto/ability_entity.dart';
import 'package:pokedex/layers/domain/entities/moves_entity.dart';

class MovesDto extends MovesEntity {
  AbilityDto? abilityDto;
  String? url;

  MovesDto({this.abilityDto, this.url})
      : super(
          move: abilityDto,
          url: url,
        );

  MovesDto.fromJson(Map<String, dynamic> json) {
    abilityDto =
        json['move'] != null ? AbilityDto.fromJson(json['move']) : null;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilityDto != null) {
      data['move'] = this.abilityDto!.toJson();
    }
    data['url'] = this.url;
    return data;
  }
}
