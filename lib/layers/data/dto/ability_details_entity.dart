import 'package:pokedex/layers/data/dto/effect_entries_entity.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';

class AbilityDetailsDto extends AbilityDetailsEntity {
  List<EffectEntriesDto>? effectEntriesDto;
  String? name;

  AbilityDetailsDto({this.effectEntriesDto, this.name})
      : super(
          effectEntries: effectEntriesDto,
          name: name,
        );

  AbilityDetailsDto.fromJson(Map<String, dynamic> json) {
    if (json['effect_entries'] != null) {
      effectEntriesDto = [];
      json['effect_entries'].forEach((v) {
        effectEntriesDto!.add(EffectEntriesDto.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.effectEntriesDto != null) {
      data['effect_entries'] =
          this.effectEntriesDto!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    return data;
  }
}
