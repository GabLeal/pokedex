import 'package:pokedex/layers/domain/entities/language_entity.dart';

class AbilityDetailsEntity {
  List<EffectEntries>? effectEntries;
  String? name;

  AbilityDetailsEntity({this.effectEntries, this.name});

  AbilityDetailsEntity.fromJson(Map<String, dynamic> json) {
    if (json['effect_entries'] != null) {
      effectEntries = [];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(new EffectEntries.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    return data;
  }
}

class EffectEntries {
  String? effect;
  LanguageEntity? language;
  String? shortEffect;

  EffectEntries({this.effect, this.language, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? new LanguageEntity.fromJson(json['language'])
        : null;
    shortEffect = json['short_effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effect'] = this.effect;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    data['short_effect'] = this.shortEffect;
    return data;
  }
}
