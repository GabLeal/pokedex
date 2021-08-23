class AbilityDetails {
  List<EffectEntries>? effectEntries;
  String? name;

  AbilityDetails({this.effectEntries, this.name});

  AbilityDetails.fromJson(Map<String, dynamic> json) {
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
  Language? language;
  String? shortEffect;

  EffectEntries({this.effect, this.language, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
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

class Language {
  String? name;
  String? url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
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
