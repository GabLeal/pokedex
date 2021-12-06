import 'package:pokedex/layers/data/dto/ability_entity.dart';
import 'package:pokedex/layers/domain/entities/type_entity.dart';

class TypesDto extends TypesEntity {
  int? slot;
  AbilityDto? typeDto;

  TypesDto({this.slot, this.typeDto})
      : super(
          slot: slot,
          type: typeDto,
        );

  TypesDto.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    typeDto =
        json['type'] != null ? new AbilityDto.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.typeDto!.toJson();
    }
    return data;
  }
}
