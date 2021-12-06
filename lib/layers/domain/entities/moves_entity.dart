import 'package:pokedex/layers/domain/entities/ability_entity.dart';

class MovesEntity {
  AbilityEntity? move;
  String? url;

  MovesEntity({
    this.move,
    this.url,
  });

  // Moves.fromJson(Map<String, dynamic> json) {
  //   move = json['move'] != null ? AbilityEntity.fromJson(json['move']) : null;
  //   url = json['url'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.move != null) {
  //     data['move'] = this.move!.toJson();
  //   }
  //   data['url'] = this.url;
  //   return data;
  // }
}
