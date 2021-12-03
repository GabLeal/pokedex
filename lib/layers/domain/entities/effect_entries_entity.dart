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
