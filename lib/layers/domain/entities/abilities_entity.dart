import 'package:pokedex/layers/domain/entities/ability_entity.dart';

class Abilities {
  Ability? ability;

  Abilities({this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? Ability.fromJson(json['ability']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability!.toJson();
    }
    return data;
  }
}
