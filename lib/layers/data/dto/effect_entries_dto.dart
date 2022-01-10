import 'package:pokedex/layers/domain/entities/effect_entries_entity.dart';

class EffectEntriesDto extends EffectEntriesEntity {
  String? effect;

  String? shortEffect;

  EffectEntriesDto({this.effect, this.shortEffect})
      : super(
          effect: effect,
          shortEffect: shortEffect,
        );

  EffectEntriesDto.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];

    shortEffect = json['short_effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effect'] = this.effect;

    data['short_effect'] = this.shortEffect;
    return data;
  }
}
