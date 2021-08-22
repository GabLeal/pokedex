class MoveDetails {
  int? accuracy;
  DamageClass? damageClass;
  int? effectChance;
  List<EffectEntries>? effectEntries;
  String? name;
  int? power;
  int? pp;
  int? priority;
  DamageClass? type;

  MoveDetails(
      {this.accuracy,
      this.damageClass,
      this.effectChance,
      this.effectEntries,
      this.name,
      this.power,
      this.pp,
      this.priority,
      this.type});

  MoveDetails.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];

    damageClass = json['damage_class'] != null
        ? new DamageClass.fromJson(json['damage_class'])
        : null;
    effectChance = json['effect_chance'];

    if (json['effect_entries'] != null) {
      effectEntries = [];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(EffectEntries.fromJson(v));
      });
    }
    name = json['name'];
    power = json['power'];
    pp = json['pp'];
    priority = json['priority'];
    type = json['type'] != null ? new DamageClass.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accuracy'] = this.accuracy;

    if (this.damageClass != null) {
      data['damage_class'] = this.damageClass!.toJson();
    }
    data['effect_chance'] = this.effectChance;

    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries!.map((v) => v.toJson()).toList();
    }

    data['power'] = this.power;
    data['pp'] = this.pp;
    data['priority'] = this.priority;

    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class DamageClass {
  String? name;
  String? url;

  DamageClass({this.name, this.url});

  DamageClass.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class EffectEntries {
  String? effect;

  String? shortEffect;

  EffectEntries({this.effect, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
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
