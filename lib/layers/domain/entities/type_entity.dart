import 'package:pokedex/layers/domain/entities/ability_entity.dart';

class TypesEntity {
  int? slot;
  AbilityEntity? type;

  TypesEntity({this.slot, this.type});

  // TypesEntity.fromJson(Map<String, dynamic> json) {
  //   slot = json['slot'];
  //   type =
  //       json['type'] != null ? new AbilityEntity.fromJson(json['type']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['slot'] = this.slot;
  //   if (this.type != null) {
  //     data['type'] = this.type!.toJson();
  //   }
  //   return data;
  // }
}
