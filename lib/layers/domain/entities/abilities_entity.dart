import 'package:pokedex/layers/domain/entities/ability_entity.dart';

class AbilitiesEntity {
  AbilityEntity? ability;

  AbilitiesEntity({this.ability});

  AbilitiesEntity.fromJson(Map<String, dynamic> json) {
    ability = json['ability'] != null
        ? AbilityEntity.fromJson(json['ability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability!.toJson();
    }
    return data;
  }
}
