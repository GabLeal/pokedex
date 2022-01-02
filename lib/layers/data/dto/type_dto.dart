import 'package:pokedex/layers/data/dto/ability_dto.dart';
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
    type = json['type'] != null ? AbilityDto.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.typeDto!.toJson();
    }
    return data;
  }
}
